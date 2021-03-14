import 'dart:async';
import 'dart:io';
import 'package:io/io.dart';

class CommonUtils {
  final ProcessManager _manager = ProcessManager();

  /// Fetches the configlet file if it doesn't exist already, and returns the
  /// exit code.
  Future<int> fetchConfiglet() async {
    final configletFile = File('bin/configlet');

    if (!configletFile.existsSync()) {
      print('Fetching configlet...');
      return _exit(await runCmdIfExecutable('bin/fetch-configlet'));
    }

    return 0;
  }

  /// Returns a [Future] with the exit code resulting from running the
  /// [executable] with [arguments].
  Future<int> runCmd(String executable, [List<String> arguments = const []]) async {
    final spawn = await _manager.spawn(executable, arguments);
    return _exit(await spawn.exitCode);
  }

  /// Returns a [Future] with the exit code resulting from running the
  /// [executable] with [arguments].
  ///
  /// If [executable] isn't executable, returns a [Future] with exit code 1 and
  /// shows an error message.
  Future<int> runCmdIfExecutable(String executable, [List<String> arguments = const []]) async {
    final result = isExecutable(executable);

    if (result is bool && !result || result is Future && !await result) {
      print('Unable to run "$executable". Make sure that it\'s executable and that you have permissions to run it.');
      return Future.value(1);
    }

    return runCmd(executable, arguments);
  }

  /// Terminates the global `stdin` listener.
  Future<Null> terminate() async {
    await ProcessManager.terminateStdIn();
  }
}

/// Returns [exitCode] and shows an error message if it is different from 0.
int _exit(int exitCode) {
  if (exitCode != 0) print('Failed. Error code: $exitCode.');
  return exitCode;
}
