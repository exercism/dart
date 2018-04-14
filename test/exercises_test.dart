import "dart:async";
import "dart:io";

import "package:test/test.dart";
import "package:yaml/yaml.dart";

/// Constants
const String envName = "EXERCISE";

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

  final String pubspecString = await pubspec.readAsString();

  final String packageName = loadYaml(pubspecString)["name"] as String;

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

  File stub = new File("lib/${packageName}.dart");
  File example = new File("lib/example.dart");

  try {
    stub = await stub.rename("lib/${packageName}.dart.bu");
    example = await example.rename("lib/${packageName}.dart");

    for (List<String> cmds in [
      /// Pull dependencies
      ["pub", "upgrade"],

      /// Run all exercise tests
      ["pub", "run", "test", "--run-skipped"]
    ]) {
      await runCmd(cmds);
    }
  } finally {
    await example.rename("lib/example.dart");
    await stub.rename("lib/${packageName}.dart");

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
  }, timeout: new Timeout(new Duration(minutes: 10)));
}
