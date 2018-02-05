import "dart:io";
import "dart:async";
import "dart:convert";
import "package:args/args.dart";
import "package:path/path.dart" show dirname;

/// Constants
const String scriptFilename = "create-exercise";

final parser = new ArgParser()
  ..addSeparator("Usage: $scriptFilename [--spec-path path] <slug>")
  ..addOption("spec-path", help: "The location of the problem-specifications directory.", valueHelp: 'path');

/// Helpers
List<String> words(String str) {
  if (str == null) return [''];

  return str
      .toLowerCase()
      .replaceAll(new RegExp(r"[^a-z0-9]"), " ")
      .replaceAll(new RegExp(r" +"), " ")
      .trim()
      .split(" ");
}

String upperFirst(String str) {
  if (str == null || str.length == 0) return '';

  final chars = str.split("");
  final first = chars.first;

  return first.toUpperCase() + chars.skip(1).join("");
}

String camelCase(String str, {bool isUpperFirst = false}) {
  final parts = words(str);
  final first = parts.first;
  final rest = parts.skip(1);

  return (isUpperFirst ? upperFirst(first) : first) + rest.map(upperFirst).join("");
}

String pascalCase(String str) => camelCase(str, isUpperFirst: true);

String snakeCase(String str) => words(str).join("_");

String kebabCase(String str) => words(str).join("-");

/// Templates
String exampleTemplate(String name) => """
class ${pascalCase(name)} {

}
""";

String mainTemplate(String name) => """
class ${pascalCase(name)} {
  // Put your code here
}
""";

String testCasesString = """
    test('should work', () {
      // TODO
    });""";

String testTemplate(String name) => """
import 'package:test/test.dart';
import 'package:${snakeCase(name)}/${snakeCase(name)}.dart';

void main() {
  final ${camelCase(name)} = new ${pascalCase(name)}();

  group('${pascalCase(name)}', () {
$testCasesString
  });
}
""";

String pubTemplate(String name) => """
name: '${snakeCase(name)}'
dev_dependencies:
  test: '<0.13.0'
""";

String testCaseTemplate(String name, Map<String, Object> testCase, {bool firstTest = true}) {
  if (testCase['cases'] != null) {
    // We have a group, not a case
    String description = testCase['description'];

    // Build the tests up recursively, only first test should be skipped
    List<String> testList = [];
    for (Map<String, Object> c in testCase['cases']) {
      testList.add(testCaseTemplate(name, c, firstTest: firstTest));
      firstTest = false;
    }
    String tests = testList.join("\n");

    if (description == null) {
      return tests;
    }

    return """
      group('$description', () {
        $tests
      });
    """;
  }

  String description = repr(testCase['description']);
  String resultType = getFriendlyType(testCase['expected']);
  String object = camelCase(name);
  String method = camelCase(testCase['property']);
  String expected = repr(testCase['expected']);

  Map<String, dynamic> input = testCase['input'] as Map<String, dynamic>;
  String arguments = input.keys.map((k) => repr(input[k])).join(', ');

  return """
    test($description, () {
      final $resultType result = $object.$method($arguments);
      expect(result, equals($expected));
    }, skip: ${!firstTest});
  """;
}

/// `repr` takes in any object and tries to coerce it to a String in such a way that it is suitable to include in code.
/// Based on the python `repr` function, but only works for basic types: String, Iterable, Map, and primitive types
String repr(Object x) {
  if (x is String) {
    x = (x as String).replaceAll('"', r'\"').replaceAll("\n", r"\n").replaceAll(r"$", r"\$");
    return '"$x"';
  }

  if (x is Iterable) {
    return '[${x.map(repr).join(", ")}]';
  }

  if (x is Map) {
    List<String> pairs = [];
    for (var k in x.keys) {
      pairs.add("${repr(k)}: ${repr(x[k])}");
    }

    return "{${pairs.join(', ')}}";
  }

  return "$x";
}

/// A helper method to get the inside type of an iterable
String getIterableType(Iterable iter) {
  Set<String> types = iter.map(getFriendlyType).toSet();

  if (types.length == 1) {
    return types.first;
  }

  return "Object";
}

/// Get a human-friendly type of a variable
String getFriendlyType(Object x) {
  if (x is String) {
    return "String";
  }

  if (x is Iterable) {
    return "List<${getIterableType(x)}>";
  }

  if (x is Map) {
    return "Map<${getIterableType(x.keys)}, ${getIterableType(x.values)}>";
  }

  if (x is num) {
    return "num";
  }

  return x.runtimeType.toString();
}

// runProcess runs a process, writes any stdout/stderr output.
// Returns true if the cmd was successful, false otherwise
Future<bool> runProcess(String cmd, List<String> arguments) async {
  final res = await Process.run(cmd, arguments, runInShell: true);
  if (!res.stdout.toString().isEmpty) {
    stdout.write(res.stdout);
  }

  if (!res.stderr.toString().isEmpty) {
    stderr.write(res.stderr);
  }

  return res.exitCode == 0;
}

Future main(args) async {
  final arguments = parser.parse(args);
  final restArgs = arguments.rest;

  if (restArgs.isEmpty) {
    stderr.write(parser.usage);
    exit(1);
  }

  final name = restArgs.first;

  // Create dir
  final currentDir = Directory.current;
  final exerciseDir = new Directory("exercises/${kebabCase(name)}");
  final filename = snakeCase(name);

  // Get test cases from canonical-data.json, format tests
  if (arguments["spec-path"] != null) {
    String filename = "${arguments['spec-path']}/exercises/$name/canonical-data.json";
    try {
      File canonicalDataJson = new File(filename);
      final specification = JSON.decode(await canonicalDataJson.readAsString());
      testCasesString = testCaseTemplate(name, specification);
      print("Found: ${arguments['spec-path']}/exercises/$name/canonical-data.json");
    } on FileSystemException {
      stderr.write("Could not open file '$filename', exiting.\n");
      exit(1);
    } on FormatException {
      stderr.write("File '$filename' is not valid JSON, exiting.\n");
      exit(1);
    }
  } else {
    print("Could not find: ${arguments['spec-path']}/exercises/$name/canonical-data.json");
  }

  if (await exerciseDir.exists()) {
    stderr.write("$name already exist\n");
    exit(1);
  }

  await new Directory("${exerciseDir.path}/lib").create(recursive: true);
  await new Directory("${exerciseDir.path}/test").create(recursive: true);

  // Create files
  String testFileName = "${exerciseDir.path}/test/${filename}_test.dart";
  await new File("${exerciseDir.path}/lib/example.dart").writeAsString(exampleTemplate(name));
  await new File("${exerciseDir.path}/lib/${filename}.dart").writeAsString(mainTemplate(name));
  await new File(testFileName).writeAsString(testTemplate(name));
  await new File("${exerciseDir.path}/pubspec.yaml").writeAsString(pubTemplate(name));

  if (arguments["spec-path"] != null) {
    // Generate README
    final dartRoot = "${dirname(Platform.script.toFilePath())}/..";
    final configletLoc = "$dartRoot/bin/configlet";
    final genSuccess = await runProcess(
        configletLoc, ["generate", "$dartRoot", "--spec-path", arguments["spec-path"], "--only", name]);
    if (genSuccess) {
      stdout.write("Successfully created README.md\n");
    } else {
      stderr.write("Warning: `configlet generate` exited with an error, 'README.md' is likely malformed.\n");
    }
  }

  // The output from file generation is not always well-formatted, use dartfmt to clean it up
  final fmtSuccess = await runProcess("dartfmt", ["-l", "120", "-w", exerciseDir.path]);
  if (fmtSuccess) {
    stdout.write("Successfully created a rough-draft of tests at '$testFileName'.\n");
    stdout.write("You should check this over and fix or refine as necessary.\n");
  } else {
    stderr.write("Warning: dartfmt exited with an error, files in '${exerciseDir.path}' may be malformed.\n");
  }

  // Install deps
  Directory.current = exerciseDir;

  final pubSuccess = await runProcess("pub", ["get"]);
  assert(pubSuccess);

  Directory.current = currentDir;
}
