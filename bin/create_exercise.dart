import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:args/args.dart';
import 'package:path/path.dart' show dirname;

/// Constants
const String scriptFilename = 'create-exercise';

final parser = new ArgParser()
  ..addSeparator('Usage: $scriptFilename [--spec-path path] <slug>')
  ..addOption('spec-path', help: 'The location of the problem-specifications directory.', valueHelp: 'path');

/// Helpers
List<String> words(final String str) {
  if (str == null) return [''];

  return str
      .toLowerCase()
      .replaceAll(new RegExp(r'[^a-z0-9]'), ' ')
      .replaceAll(new RegExp(r' +'), ' ')
      .trim()
      .split(' ');
}

String upperFirst(final String str) {
  if (str == null || str.length == 0) return '';

  final chars = str.split('');
  final first = chars.first;

  return first.toUpperCase() + chars.skip(1).join('');
}

String camelCase(String str, {bool isUpperFirst = false}) {
  final parts = words(str);
  final first = parts.first;
  final rest = parts.skip(1);

  return (isUpperFirst ? upperFirst(first) : first) + rest.map(upperFirst).join('');
}

String pascalCase(String str) => camelCase(str, isUpperFirst: true);

String snakeCase(String str) => words(str).join('_');

String kebabCase(String str) => words(str).join('-');

/// Templates
String exampleTemplate(String name) => '''
class ${pascalCase(name)} {

}
''';

String mainTemplate(String name) => '''
class ${pascalCase(name)} {
  // Put your code here
}
''';

String _testCasesString = '''
    test('should work', () {
      // TODO
    });''';

/// The test template sorts the import of packages, instantiates an instance of the exercise class, and defines the main
/// function's group of tests.
String testTemplate(String name) {
  final packages = <String>[name, 'test'];
  packages.sort();

  return '''
import 'package:${snakeCase(packages[0])}/${snakeCase(packages[0])}.dart';
import 'package:${snakeCase(packages[1])}/${snakeCase(packages[1])}.dart';

final ${camelCase(name)} = new ${pascalCase(name)}();

void main() {
  group('${pascalCase(name)}', () {
$_testCasesString
  });
}
''';
}

String pubTemplate(String name) => '''
name: '${snakeCase(name)}'
environment:
  sdk: '>=2.0.0 <3.0.0'
dev_dependencies:
  test: '<2.0.0'
''';

String analysisOptionsTemplate() => '''
analyzer:
  strong-mode:
    implicit-casts: false
    implicit-dynamic: false
  errors:
    unused_element:        error
    unused_import:         error
    unused_local_variable: error
    dead_code:             error

linter:
  rules:
    # Error Rules
    - avoid_relative_lib_imports
    - avoid_types_as_parameter_names
    - literal_only_boolean_expressions
    - no_adjacent_strings_in_list
    - valid_regexps
''';

String testCaseTemplate(String exerciseName, Map<String, Object> testCase, {bool firstTest = true, String returnType}) {
  bool skipTests = firstTest;

  if (testCase['cases'] != null) {
    if (returnType == null) {
      returnType = _determineBestReturnType(testCase['cases'] as List<dynamic>);
    }

    // We have a group, not a case
    String description = _handleQuotes(testCase['description'] as String);

    // Build the tests up recursively, only first test should be skipped
    List<String> testList = <String>[];
    for (Map<String, Object> caseObj in testCase['cases'] as dynamic) {
      testList.add(testCaseTemplate(exerciseName, caseObj, firstTest: skipTests, returnType: returnType));
      skipTests = false;
    }
    String tests = testList.join('\n');

    if (description == null) {
      return tests;
    }

    return '''
      group('$description', () {
        $tests
      });
    ''';
  }

  String description = repr(testCase['description']);
  String object = camelCase(exerciseName);
  String method = testCase['property'].toString();
  String expected = repr(testCase['expected'], typeDeclaration: returnType);

  Map<String, dynamic> input = testCase['input'] as Map<String, dynamic>;
  String arguments = input.keys.map((k) => repr(input[k])).join(', ');
  arguments = arguments == 'null' ? '' : arguments;

  if (_containsWhitespaceCodes(arguments)) {
    arguments = _protectWhitespaces(arguments);
  }

  final result = '''
    test($description, () {
      final $returnType result = $object.$method($arguments);
      expect(result, equals($expected));
    }, skip: ${!skipTests});
''';

  return result;
}

/// Determines whether the script should generate an exercise.
Future<bool> _doGenerate(Directory exerciseDir, String exerciseName, String version) async {
  if (await exerciseDir.exists()) {
    if (await Directory('${exerciseDir.path}/.meta').exists()) {
      if (await File('${exerciseDir.path}/.meta/version').exists()) {
        String currentVersion = await File('${exerciseDir.path}/.meta/version').readAsString();

        if (currentVersion == version) {
          stderr.write('$exerciseName of version, $currentVersion, already exists\n');
          exit(1);
        }
      }
    }
    stderr.write('$exerciseName already exists\n');
    exit(1);
  }

  return true;
}

/// Creates/updates an exercise.
void _generateExercise(Map<String, Object> specification, String exerciseFilename, String exerciseName,
    Directory exerciseDir, String version, ArgResults arguments) async {
  _testCasesString = testCaseTemplate(exerciseName, specification);
  print('Found: ${arguments['spec-path']}/exercises/$exerciseName/canonical-data.json');

  await new Directory('${exerciseDir.path}/.meta').create(recursive: true);
  await new Directory('${exerciseDir.path}/lib').create(recursive: true);
  await new Directory('${exerciseDir.path}/test').create(recursive: true);

  // Create files
  String testFileName = '${exerciseDir.path}/test/${exerciseFilename}_test.dart';
  await new File('${exerciseDir.path}/.meta/version').writeAsString(version);
  await new File('${exerciseDir.path}/lib/example.dart').writeAsString(exampleTemplate(exerciseName));
  await new File('${exerciseDir.path}/lib/${exerciseFilename}.dart').writeAsString(mainTemplate(exerciseName));
  await new File(testFileName).writeAsString(testTemplate(exerciseName));
  await new File('${exerciseDir.path}/analysis_options.yaml').writeAsString(analysisOptionsTemplate());
  await new File('${exerciseDir.path}/pubspec.yaml').writeAsString(pubTemplate(exerciseName));

  // Generate README
  final dartRoot = '${dirname(Platform.script.toFilePath())}/..';
  final configletLoc = '$dartRoot/bin/configlet';
  final genSuccess = await runProcess(
      configletLoc, ['generate', '$dartRoot', '--spec-path', '${arguments['spec-path']}', '--only', exerciseName]);
  if (genSuccess) {
    stdout.write('Successfully created README.md\n');
  } else {
    stderr.write('Warning: `configlet generate` exited with an error, \'README.md\' is likely malformed.\n');
  }

  // The output from file generation is not always well-formatted, use dartfmt to clean it up
  final fmtSuccess =
      await runProcess('pub', ['run', 'dart_style:format', '-i', '0', '-l', '120', '-w', exerciseDir.path]);
  if (fmtSuccess) {
    stdout.write('Successfully created a rough-draft of tests at \'$testFileName\'.\n');
    stdout.write('You should check this over and fix or refine as necessary.\n');
  } else {
    stderr
        .write('Warning: dart_style:format exited with an error, files in \'${exerciseDir.path}\' may be malformed.\n');
  }

  // Install deps
  Directory.current = exerciseDir;

  final pubSuccess = await runProcess('pub', ['get']);
  assert(pubSuccess);
}

String _protectWhitespaces(String input) => input..replaceAll('\\', '\\\\');

bool _containsWhitespaceCodes(String input) {
  return input.contains('\n') || input.contains('\r') || input.contains('\t');
}

String _determineBestReturnType(List<dynamic> specCases) {
  final expectedList = retrieveListOfExpected(specCases);

  final dynamic first = expectedList.isNotEmpty ? expectedList.first : null;

  if (first is Iterable) {
    final iterableType = '${getIterableType(first)}';

    if (first is List) {
      return 'List<$iterableType>';
    }

    if (first is Set) {
      return 'Set<$iterableType>';
    }
  }

  if (first is Map) {
    return 'Map${getMapType(first)}';
  }

  if (first is String) {
    return 'String';
  }

  if (first is num) {
    if (first is int) {
      return 'int';
    } else if (first is double) {
      return 'double';
    } else {
      return 'num';
    }
  }

  if (first is bool) {
    return 'bool';
  }
  return '';
}

Set<dynamic> retrieveListOfExpected(List<dynamic> list, {Set<dynamic> expectedTypeSet}) {
  if (expectedTypeSet == null) {
    expectedTypeSet = new Set<dynamic>();
  }

  for (int count = 0; count < list.length; count++) {
    if (list[count] is Map) {
      Map entry = list[count] as Map;
      bool addEntry = true;

      if (entry.containsKey('expected')) {
        if (entry['expected'] is Map) {
          addEntry = !(entry['expected'] as Map).containsKey('error');
        }

        if (entry['expected'] is Iterable) {
          addEntry = (entry['expected'] as Iterable).isNotEmpty;
        }

        if (addEntry) {
          expectedTypeSet.add(entry['expected']);
        }
      }

      if (entry.containsKey('cases')) {
        expectedTypeSet = retrieveListOfExpected(entry['cases'] as List, expectedTypeSet: expectedTypeSet);
      }
    }

    if (list[count] is List) {
      expectedTypeSet = retrieveListOfExpected(list[count] as List, expectedTypeSet: expectedTypeSet);
    }
  }

  return expectedTypeSet;
}

String _handleQuotes(String arguments) {
  if (arguments != null) {
    final firstChar = arguments[0];
    final lastChar = arguments[arguments.length - 1];
    final shortenArgs = arguments.substring(1, arguments.length - 1).replaceAll('\'', '\\\'');

    return '$firstChar$shortenArgs$lastChar';
  } else {
    return null;
  }
}

/// `repr` takes in any object and tries to coerce it to a String in such a way that it is suitable to include in code.
/// Based on the python `repr` function, but only works for basic types: String, Iterable, Map, and primitive types
/// `typeDeclaration` is the determined return type and used to determine the type within collections.
String repr(Object x, {String typeDeclaration}) {
  if (x is String) {
    String result = x
        .replaceAll('\'', r"\'")
        .replaceAll('\n', r'\n')
        .replaceAll('\r', r'\r')
        .replaceAll('\t', r'\t')
        .replaceAll(r'$', r'\$');
    return '\'$result\'';
  }

  if (x is Iterable) {
    String iterableType;

    if (typeDeclaration != null) {
      final RegExp iterables = new RegExp(r'List|Map|Set');
      iterableType = typeDeclaration.replaceFirst(iterables, '');
    } else {
      iterableType = '<${getIterableType(x)}>';
    }

    if (x is List) {
      return '$iterableType[${x.map(repr).join(', ')}]';
    } else if (x is Set) {
      return '$iterableType{${x.map(repr).join(', ')}}';
    }
  }

  if (x is Map) {
    return _defineMap(x, '${getMapType(x)}');
  }

  return '$x';
}

String _defineMap(Map x, String iterableType) {
  final pairs = <String>[];
  for (var k in x.keys) {
    pairs.add('${repr(k)}: ${repr(x[k])}');
  }

  return '$iterableType{${pairs.join(', ')}}';
}

/// A helper method to get the inside type of an iterable
String getIterableType(Iterable iter) {
  Set<String> types = iter.map(getFriendlyType).toSet();

  if (types.length == 1) {
    return types.first;
  }

  return 'Object';
}

/// A helper method to get the inside type of a map
String getMapType(Map map) {
  Set<String> keyTypes = map.keys.map(getFriendlyType).toSet();
  Set<String> valueTypes = map.values.map(getFriendlyType).toSet();

  String mapKeyType = keyTypes.length == 1 ? keyTypes.first : 'dynamic';
  String mapValueType = valueTypes.length == 1 ? valueTypes.first : 'dynamic';

  return '<$mapKeyType, $mapValueType>';
}

/// Get a human-friendly type of a variable
String getFriendlyType(Object x) {
  if (x is String) {
    return 'String';
  }

  if (x is Iterable) {
    return 'List<${getIterableType(x)}>';
  }

  if (x is Map) {
    return 'Map<${getIterableType(x.keys)}, ${getIterableType(x.values)}>';
  }

  if (x is num) {
    if (x is int) {
      return 'int';
    } else if (x is double) {
      return 'double';
    } else {
      return 'num';
    }
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

Future main(List<String> args) async {
  final arguments = parser.parse(args);
  final restArgs = arguments.rest;

  if (restArgs.isEmpty) {
    stderr.write(parser.usage);
    exit(1);
  }

  final exerciseName = restArgs.first;
  final exerciseDir = new Directory('exercises/${kebabCase(exerciseName)}');

  // Create dir
  final currentDir = Directory.current;
  final exerciseFilename = snakeCase(exerciseName);

  // Get test cases from canonical-data.json, format tests
  if (arguments['spec-path'] != null) {
    String canonicalFilePath = '${arguments['spec-path']}/exercises/$exerciseName/canonical-data.json';
    try {
      final File canonicalDataJson = new File(canonicalFilePath);
      final source = await canonicalDataJson.readAsString();
      final Map<String, Object> specification = json.decode(source) as Map<String, Object>;
      final version = specification['version'].toString();

      if (await _doGenerate(exerciseDir, exerciseName, version)) {
        _generateExercise(specification, exerciseFilename, exerciseName, exerciseDir, version, arguments);
      }
    } on FileSystemException {
      stderr.write('Could not open file \'$canonicalFilePath\', exiting.\n');
      exit(1);
    } on FormatException {
      stderr.write('File \'$canonicalFilePath\' is not valid JSON, exiting.\n');
      exit(1);
    }
  } else {
    print('Could not find: ${arguments['spec-path']}/exercises/$exerciseName/canonical-data.json');
  }

  Directory.current = currentDir;
}
