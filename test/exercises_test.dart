@Timeout(const Duration(seconds: 45))

import "dart:io";
import "dart:async";

import "package:test/test.dart";
import "package:yaml/yaml.dart";

/** Constants */
const ENV_NAME = "EXERCISE";

/** Helpers */
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

Future getPackageName() async {
  final pubspec = new File("pubspec.yaml");

  final packageName = loadYaml(await pubspec.readAsString())["name"];

  return packageName;
}

Future locateExercismDirAndExecuteTests() async {
  final exercisesRootDir = new Directory("exercises");

  assert(await exercisesRootDir.exists());

  final exercisesDirs = exercisesRootDir.listSync().where((d) => d is Directory);

  for (dynamic dir in exercisesDirs) {
    await runTest(dir.path);
  }
}

Future runTest(String path) async {
  final current = Directory.current;

  Directory.current = path;

  dynamic packageName = await getPackageName();

  print("""
================================================================================
Running tests for: $packageName
================================================================================
""");

  await runCmd(["cp", "lib/${packageName}.dart", "lib/${packageName}.dart.bu"]);
  await runCmd(["cp", "test/${packageName}_test.dart", "test/${packageName}_test.dart.bu"]);
  try {
    for (dynamic cmds in [
      /// Replace main file with example
      ["cp", "lib/example.dart", "lib/${packageName}.dart"],

      /// Enable all tests
      ["sed", "-i", "-e", "s/\\bskip:\\s*true\\b/skip: false/g", "test/${packageName}_test.dart"],

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

Future runAllTests() async {
  final dartExercismRootDir = new Directory("..");

  assert(await dartExercismRootDir.exists());

  await locateExercismDirAndExecuteTests();

  Directory.current = dartExercismRootDir.parent;

  dynamic packageName = await getPackageName();

  print("""

================================================================================
Running tests for: $packageName
================================================================================
""");
}

void main() {
  final testname = Platform.environment[ENV_NAME];

  test("Exercises", () async {
    if (testname == null) {
      await runAllTests();
    } else {
      final testpath = "${Directory.current.path}/exercises/$testname";

      if (!await new Directory(testpath).exists()) {
        throw new ArgumentError("No exercise with this name: $testname");
      }

      await runTest(testpath);
    }
  });
}
