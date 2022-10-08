import 'dart:async';
import 'package:exercism_dart/src/utils.dart';

Future<Null> main() async {
  final CommonUtils utils = CommonUtils();

  if (await utils.fetchConfiglet() == 0) {
    print('Formatting config.json...');
    print('Unsupported operation: Please see https://github.com/exercism/dart/issues/296');
    // await utils.runCmdIfExecutable('bin/configlet', ['fmt', '.']);
  }

  print('Formatting all Dart files...');
  await utils.runCmd('dart', ['run', 'dart_style:format', '-l', '120', '-w', '.']);

  print('Running tests...');
  await utils.runCmd('dart', ['run', 'test']);

  await utils.terminate();
  print('Done!');
}
