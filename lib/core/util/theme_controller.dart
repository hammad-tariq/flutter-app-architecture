import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constant.dart';

class ThemeController extends GetxController {
  // initializing through service locator.
  var sharedPreferences = GetIt.I<SharedPreferences>();

  late ThemeMode _themeMode;

  // ThemeMode.Getter
  ThemeMode get themeMode => _themeMode;

  Future<void> setThemeMode(ThemeMode themeMode) async {
    Get.changeThemeMode(themeMode);
    _themeMode = themeMode;
    update();
    await sharedPreferences.setString(
        CURRENT_LANG_FLAG, themeMode.toString().split('.')[1]);
  }

  /// Get User preferred theme mode and set it by default.
  getThemeModePreferences() async {
    ThemeMode themeMode;
    // Get System as default theme.
    String themeTxt =
        sharedPreferences.getString(CURRENT_LANG_FLAG) ?? 'System';
    try {
      themeMode = ThemeMode.values
          .firstWhere((element) => describeEnum(element) == themeTxt);
    } catch (exception) {
      themeMode = ThemeMode.system;
      exception.printError();
    }
    setThemeMode(themeMode);
  }
}
