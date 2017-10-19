import 'dart:async';
import 'utils.dart';

Future<Null> main() async {
  final PresubmitUtils utils = new PresubmitUtils();

  await utils.fetchConfiglet();

  print('Checking config.json formatting...');
  await utils.run('bin/configlet', ['lint', '.']);

  print('Checking all Dart files formatting...');
  await utils.run('pub', ['run', 'dart_style:format', '-l', '120', '-n', '.']);

  await utils.terminate();
  print('Done!');
}
