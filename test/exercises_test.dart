import "dart:io";
import "dart:async";

import "package:test/test.dart";
import "package:yaml/yaml.dart";

/// Constants
const envName = "EXERCISE";

/// Helpers
Future runCmd(List<String> cmds) async {
  final cmd = cmds.first;
  final other = cmds.skip(1).toList();

  final res = await Process.run(cmd, other, runInShell: true);

  if (!res.stdout.toString().isEmpty) {
    stdout.write(res.stdout);
  }

  if (!res.stderr.toString().isEmpty) {
    stderr.write(res.stderr);
  }

  assert(res.exitCode == 0);
}

Future<String> getPackageName() async {
  final pubspec = new File("pubspec.yaml");

  final packageName = loadYaml(await pubspec.readAsString())["name"];

  return packageName;
}

Future locateExercismDirAndExecuteTests() async {
  final exercisesRootDir = new Directory("exercises");

  assert(await exercisesRootDir.exists());

  final exercisesDirs = exercisesRootDir.listSync().where((d) => d is Directory);

  /// Sort directories alphabetically
  final sortedExerciseDirs = exercisesDirs.toList();
  sortedExerciseDirs.sort((a, b) => a.path.compareTo(b.path));

  for (FileSystemEntity dir in sortedExerciseDirs) {
    await runTest(dir.path);
  }
}

/// Execute a single test
Future runTest(String path) async {
  final current = Directory.current;

  Directory.current = path;

  String packageName = await getPackageName();

  print("""
================================================================================
Running tests for: $packageName
================================================================================
""");

  await runCmd(["cp", "lib/${packageName}.dart", "lib/${packageName}.dart.bu"]);
  await runCmd(["cp", "test/${packageName}_test.dart", "test/${packageName}_test.dart.bu"]);
  try {
    String inPlaceOption = Platform.isMacOS ? "--in-place" : "-i";

    for (List<String> cmds in [
      /// Replace main file with example
      ["cp", "lib/example.dart", "lib/${packageName}.dart"],

      /// Enable all tests
      ["sed", inPlaceOption, "-e", "s/\\bskip:\\s*true\\b/skip: false/g", "test/${packageName}_test.dart"],

      /// Pull dependencies
      ["pub", "get"],

      /// Run tests
      ["pub", "run", "test"]
    ]) {
      await runCmd(cmds);
    }
  } finally {
    await runCmd(["mv", "lib/${packageName}.dart.bu", "lib/${packageName}.dart"]);
    await runCmd(["mv", "test/${packageName}_test.dart.bu", "test/${packageName}_test.dart"]);

    Directory.current = current;
  }
}

/// Execute all the tests under the exercise directory
Future runAllTests() async {
  final dartExercismRootDir = new Directory("..");

  assert(await dartExercismRootDir.exists());

  await locateExercismDirAndExecuteTests();

  Directory.current = dartExercismRootDir.parent;

  String packageName = await getPackageName();

  print("""

================================================================================
Running tests for: $packageName
================================================================================
""");
}

void main() {
  final testName = Platform.environment[envName];

  test("Exercises", () async {
    if (testName == null) {
      await runAllTests();
    } else {
      final testPath = "${Directory.current.path}/exercises/$testName";

      if (!await new Directory(testPath).exists()) {
        throw new ArgumentError("No exercise with this name: $testName");
      }

      await runTest(testPath);
    }
  }, timeout: new Timeout(new Duration(seconds: 120)));
}
