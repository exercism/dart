import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:archive/archive.dart';

/// Map of supported platforms and expected release file names
const _supportedPlatforms = {
  'linux-32bit': 'configlet-linux-32bit.tgz',
  'linux-64bit': 'configlet-linux-64bit.tgz',
  'linux-arm-v5': 'configlet-linux-arm-v5.tgz',
  'linux-arm-v6': 'configlet-linux-arm-v6.tgz',
  'mac-32bit': 'configlet-mac-32bit.tgz',
  'mac-64bit': 'configlet-mac-64bit.tgz',
  'windows-32bit': 'configlet-windows-32bit.zip',
  'windows-64bit': 'configlet-windows-64bit.zip',
};

final _dartPlatformToSupportedPlatform = {
  'linux': [
    'linux-32bit',
    'linux-64bit',
    // Based on the release download count for these platforms, it looks like
    // they are not widely used.
    // These are skipped for now.
    /* 'linux-arm-v5', 'linux-arm-v6' */
  ],
  'macos': ['mac-32bit', 'mac-64bit'],
  'windows': ['windows-32bit', 'windows-64bit'],
};

final _releaseApi = Uri.parse(
    'https://api.github.com/repos/exercism/configlet/releases?per_page=1');

Future<void> main() async {
  final platforms = _dartPlatformToSupportedPlatform.putIfAbsent(
    Platform.operatingSystem.toLowerCase(),
    () => throw UnsupportedError(
        'Platform `${Platform.operatingSystem}` is not supported'),
  );

  final arch = await _getArch();

  final detectedPlatform = platforms.firstWhere(
    (p) => p.endsWith(arch),
    orElse: () =>
        throw UnsupportedError('Architecture `$arch` is not supported '),
  );

  final expectedReleaseFile = _supportedPlatforms[detectedPlatform];

  exitCode =
      await _fetchConfiglet(expectedReleaseFile).catchError((dynamic onError) {
    print('Failed with error:\n$onError');
    return 1;
  });

  exit(exitCode);
}

/// Uses platform specific shell commands to determine the current architecture
String _getArch() {
  final command = Platform.isWindows ? 'wmic' : 'uname';
  final commandArgs =
      Platform.isWindows ? ['OS', 'get', 'OSArchitecture'] : ['-m'];

  final process = Process.runSync(command, commandArgs);

  final stdout = process.stdout as String;

  if (stdout.contains('64')) return '64bit';
  if (stdout.contains('386')) return '32bit';
  if (stdout.contains('686')) return '32bit';

  return '64bit';
}

/// Fetches the latest version of configlet if local version is outdated or
/// it doesn't exist return `0` on success `1` on failure.
Future<int> _fetchConfiglet(String expectedReleaseFile) async {
  ArgumentError.checkNotNull(expectedReleaseFile, 'expectedReleaseFile');

  final httpClient = HttpClient();

  final latestRelease = await _getLatestRelease(httpClient);

  // Release tag is of the form `vx.y.z`, where x,y,z are major,minor,hotfix
  // respectively
  final latestReleaseTag =
      (latestRelease['tag_name'] as String).replaceAll('v', '');

  if (_verifyConfiglet(latestReleaseTag)) {
    return 0;
  }

  final assets = latestRelease['assets'] as List;

  final downloadUrl = assets.cast<Map>().firstWhere(
        (a) => a['name'] == expectedReleaseFile,
        orElse: () => <String, String>{},
      )['browser_download_url'] as String;

  if (downloadUrl == null) {
    throw Exception(
        'Expected release file ($expectedReleaseFile) was not found in assets.');
  }

  await httpClient
      .getUrl(Uri.parse(downloadUrl))
      .then((req) => req.close())
      .then((res) => res.toList())
      .then((bytes) => MapEntry(expectedReleaseFile, bytes))
      .then(_extractArchive);

  if (_verifyConfiglet(latestReleaseTag)) {
    return 0;
  }

  /// This might happen due to corrupted download or insufficient permissions.
  print('Failed to verify configlet download');

  return 1;
}

Future<Map<String, dynamic>> _getLatestRelease(HttpClient httpClient) async {
  final releases$ = await (await httpClient.getUrl(_releaseApi)).close();

  final releases = await releases$.transform(Utf8Codec().decoder).join();
  final releasesJson = JsonCodec().decode(releases) as List;

  /// latest release is at index 0
  return releasesJson[0] as Map<String, dynamic>;
}

/// Expects a map entry with archive filename as key and archive bytes as value
FutureOr<void> _extractArchive(MapEntry<String, List<List<int>>> archiveBytes) {
  Archive archive;

  final bytes = archiveBytes.value
      .fold(<int>[], (List<int> acc, next) => acc..addAll(next));

  if (archiveBytes.key.endsWith('.zip')) {
    archive = ZipDecoder().decodeBytes(bytes);
  } else {
    archive = TarDecoder().decodeBytes(bytes);
  }

  archive.files.forEach((f) {
    final content = f.content as List<int>;
    final file = File('bin/' + f.name)..writeAsBytesSync(content);

    print('Created: "${file.path}"');
  });
}

/// Checks if the installed version of configlet matches [latestReleaseTag]
/// Note: It assumes configlet **exists** at path `bin/configlet`
bool _verifyConfiglet(String latestReleaseTag) {
  try {
    final configlet = Process.runSync(
      'bin${Platform.pathSeparator}configlet',
      ['version'],
      runInShell: Platform.isWindows,
    );

    final localVersion = configlet.stdout as String;

    return localVersion.contains(latestReleaseTag);
  } catch (_) {
    return false;
  }
}
