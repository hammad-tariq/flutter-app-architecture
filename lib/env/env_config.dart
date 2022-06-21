import 'package:flutter/material.dart';

enum EnvType { DEVELOPMENT, STAGING, PRODUCTION }

class FlutterAppConfig {
  FlutterAppConfig(
      {@required this.appName,
      @required this.flavorName,
      @required this.apiBaseURL});

  final String appName;
  final String flavorName;
  final String apiBaseURL;

  static FlutterAppConfig _instance;

  static FlutterAppConfig getInstance({appName, flavorName, apiBaseUrl}) {
    if (_instance == null) {
      _instance = FlutterAppConfig(
          appName: appName, flavorName: flavorName, apiBaseURL: apiBaseUrl);
      print('APP CONFIGURED FOR: $flavorName');
      return _instance;
    }
    return _instance;
  }
}
