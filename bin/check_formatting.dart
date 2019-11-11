import 'dart:async';
import 'package:exercism_dart/src/utils.dart';

Future main() async {
  final CommonUtils utils = new CommonUtils();
  int errorCode = 0;

  if (utils.fetchConfiglet() == 0) {
    print('Checking config.json formatting...');
    errorCode = await utils.runCmdIfExecutable('bin/configlet', ['lint', '--track-id', 'dart', '.']);

    if (errorCode != 0) {
      print('Checking config.json formatting failed!!');
      await utils.terminate();
      throw new StateError('Formatting failed.');
    }
  }

  print('Checking all Dart files formatting...');
  errorCode = await utils
      .runCmd('pub', ['run', 'dart_style:format', '-i', '0', '-l', '120', '-n', '--set-exit-if-changed', '.']);

  if (errorCode != 0) {
    print('Checking exercise formatting failed!!');
    await utils.terminate();
    throw new StateError('Formatting failed.');
  }

  await utils.terminate();
}
