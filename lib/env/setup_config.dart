import 'env_config.dart';

class SetupConfig {
  void startProduction() {
    FlutterAppConfig.getInstance(
      appName: 'Test Arch App',
      flavorName: 'prod',
      apiBaseUrl: 'https://google.com',
    );
  }

  void startDev() {
    FlutterAppConfig.getInstance(
      appName: 'Zand Corporate',
      flavorName: 'dev',
      apiBaseUrl: 'https://google.com',
    );
  }

  void startLocal() {
    FlutterAppConfig.getInstance(
      appName: 'Test Arch App',
      flavorName: 'local',
      apiBaseUrl: 'http://192.168.54.32:7000',
    );
  }
}
