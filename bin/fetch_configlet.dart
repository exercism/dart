import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:archive/archive.dart';

Future<Null> main() async {
  exitCode = await fetch_configlet().catchError((dynamic onError) {
    print('Failed with error:\n$onError');
    return 1;
  });

  exit(exitCode);
}

final githubApi = Uri.parse('https://api.github.com/repos/exercism/configlet/releases?per_page=1');

Future<List<List<int>>> downloadRelease(
    String osArch, Map<String, dynamic> latestRelease, HttpClient httpClient) async {
  final assets = latestRelease['assets'] as List;

  /// find the asset for current OS and Arch
  final asset = assets.firstWhere((dynamic el) {
    final name = (el as Map)['name'] as String;
    return name.contains(Platform.operatingSystem) && name.contains(osArch);
  }) as Map;

  final downloadUrl = asset['browser_download_url'] as String;

  print('Downloading latest release from \n$downloadUrl');

  return httpClient.getUrl(Uri.parse(downloadUrl)).then((req) => req.close().then((res) => res.toList()));
}

void extractArchive(List<List<int>> downloadedBytes) {
  Archive archive;

  final bytes = downloadedBytes.reduce((acc, next) => new List()..addAll(acc)..addAll(next));

  if (Platform.isWindows) {
    archive = new ZipDecoder().decodeBytes(bytes);
  } else {
    archive = new TarDecoder().decodeBytes(bytes);
  }

  archive.files.forEach((f) {
    final content = f.content as List<int>;
    final file = new File('bin/' + f.name)..writeAsBytesSync(content);

    print('Created: "${file.path}"\n');
  });
}

/// Fetches the latest version of configlet if local version is outdated or
/// it doesn't exist return `0` on success `1` on failure.
Future<int> fetch_configlet() async {
  final osArch = getArch();
  final httpClient = new HttpClient();

  final latestRelease = await getLatestRelease(httpClient);

  final latestReleaseTag = (latestRelease['tag_name'] as String).replaceAll('v', '');

  if (verifyConfiglet(latestReleaseTag)) {
    return 0;
  }

  final configlet = await downloadRelease(osArch, latestRelease, httpClient);

  extractArchive(configlet);

  if (verifyConfiglet(latestReleaseTag)) {
    return 0;
  }

  /// This might happen due to corrupted download or insufficient permissions.
  print('Failed to verify configlet download');

  return 1;
}

String getArch() {
  final command = Platform.isWindows ? 'wmic' : 'uname';
  final commandArgs = Platform.isWindows ? ['OS', 'get', 'OSArchitecture'] : ['-m'];

  final process = Process.runSync(command, commandArgs);

  final stdout = process.stdout as String;

  if (stdout.contains('64')) return '64bit';
  if (stdout.contains('386')) return '32bit';
  if (stdout.contains('686')) return '32bit';

  return '64bit';
}

Future<Map<String, dynamic>> getLatestRelease(HttpClient httpClient) async {
  final releases$ = await (await httpClient.getUrl(githubApi)).close();

  final releases = await releases$.transform(new Utf8Codec().decoder).join();
  final releasesJson = new JsonCodec().decode(releases) as List;

  /// latest release is at index 0
  return releasesJson[0] as Map<String, dynamic>;
}

/// Checks if the installed version of configlet matches [latestReleaseTag]
/// Note: It assumes configlet **exists** at path `bin/configlet`
bool verifyConfiglet(String latestReleaseTag) {
  try {
    final configlet =
        Process.runSync('bin${Platform.pathSeparator}configlet', ['version'], runInShell: Platform.isWindows);

    final localVersion = configlet.stdout as String;

    return localVersion.contains(latestReleaseTag);
  } catch (_) {
    return false;
  }
}
