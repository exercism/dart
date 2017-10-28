import 'dart:async';
import 'package:exercism_dart/src/utils.dart';

Future<Null> main() async {
  final CommonUtils utils = new CommonUtils();

  if (utils.fetchConfiglet() == 0) {
    print('Checking config.json formatting...');
    await utils.runCmdIfExecutable('bin/configlet', ['lint', '--track-id', 'dart', '.']);
  }

  print('Checking all Dart files formatting...');
  await utils.runCmd('pub', ['run', 'dart_style:format', '-l', '120', '-n', '.']);

  await utils.terminate();
  print('Done!');
}
