import 'dart:async';
import 'dart:io';
import 'package:io/io.dart';

class CommonUtils {
  ProcessManager _manager;

  CommonUtils() {
    this._manager = new ProcessManager();
  }

  /// Fetches the configlet file if it doesn't exist already, and returns the
  /// exit code.
  int fetchConfiglet() {
    print('Fetching configlet...');
    return _exit(Process.runSync('dart', ['bin/fetch_configlet.dart'], runInShell: true).exitCode);
  }

  /// Returns a [Future] with the exit code resulting from running the
  /// [executable] with [arguments].
  Future<int> runCmd(String executable, [List<String> arguments = const []]) async {
    Process spawn = await _manager.spawn(executable, arguments);
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
      return new Future.value(1);
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
