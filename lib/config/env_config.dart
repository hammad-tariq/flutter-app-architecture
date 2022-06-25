enum EnvType { development, production }

class GlobalAppConfig {
  final String? appName;
  final String? flavorName;
  final String? apiBaseURL;

  GlobalAppConfig(
      {required this.appName,
      required this.flavorName,
      required this.apiBaseURL});

  static GlobalAppConfig? _globalAppConfig;

  static GlobalAppConfig? getInstance({appName, flavorName, apiBaseUrl}) {
    if (_globalAppConfig == null) {
      _globalAppConfig = GlobalAppConfig(
          appName: appName, flavorName: flavorName, apiBaseURL: apiBaseUrl);
      return _globalAppConfig;
    }
    return _globalAppConfig;
  }
}
