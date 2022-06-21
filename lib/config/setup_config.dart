import 'env_config.dart';

class SetupConfig {
  void startDev() {
    GlobalAppConfig.getInstance(appName: '', flavorName: '', apiBaseUrl: '');
  }

  void startProd() {
    GlobalAppConfig.getInstance(appName: '', flavorName: '', apiBaseUrl: '');
  }
}
