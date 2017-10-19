import 'dart:async';
import 'utils.dart';

Future<Null> main() async {
  final PresubmitUtils utils = new PresubmitUtils();

  await utils.fetchConfiglet();

  print('Formatting config.json...');
  await utils.run('bin/configlet', ['fmt', '.']);

  print('Formatting all Dart files...');
  await utils.run('pub', ['run', 'dart_style:format', '-l', '120', '-w', '.']);

  print('Running test...');
  await utils.run('pub', ['run', 'test']);

  await utils.terminate();
  print('Done!');
}
