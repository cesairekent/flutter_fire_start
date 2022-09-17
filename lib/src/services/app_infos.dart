import 'package:package_info_plus/package_info_plus.dart';

class AppInfos {
  Future<String> getAppVersion() async {
    PackageInfo pkgInfos = await PackageInfo.fromPlatform();
    return "V.${pkgInfos.version} ${pkgInfos.buildNumber}";
  }
}
