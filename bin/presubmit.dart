import 'dart:async';
import 'package:exercism_dart/src/utils.dart';

Future<Null> main() async {
  final CommonUtils utils = CommonUtils();

  if (utils.fetchConfiglet() == 0) {
    print('Formatting config.json...');
    await utils.runCmdIfExecutable('bin/configlet', ['fmt', '.']);
  }

  print('Formatting all Dart files...');
  await utils.runCmd('pub', ['run', 'dart_style:format', '-l', '120', '-w', '.']);

  print('Running tests...');
  await utils.runCmd('pub', ['run', 'test']);

  await utils.terminate();
  print('Done!');
}
