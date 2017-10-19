import 'dart:async';
import 'dart:io';
import 'package:io/io.dart';

class PresubmitUtils {
  ProcessManager manager;

  PresubmitUtils() {
    this.manager = new ProcessManager();
  }

  /// Fetches the configlet file if it doesn't exist already.
  Future<Null> fetchConfiglet() async {
    File configletFile = new File('bin/configlet');

    if (!configletFile.existsSync()) {
      print('Fetching configlet...');
      Process spawn = await manager.spawn('bin/fetch-configlet', []);
      await spawn.exitCode;
    }
  }

  /// Runs the [executable] with [arguments].
  Future<Null> run(String executable, [List<String> arguments = const []]) async {
    Process spawn = await manager.spawn(executable, arguments);
    await spawn.exitCode;
  }

  /// Terminates the global `stdin` listener.
  Future<Null> terminate() async {
    await ProcessManager.terminateStdIn();
  }
}
