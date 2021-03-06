import 'package:flutter/material.dart';
import 'package:flutter_app/src/core/util/theme_controller.dart';
import 'package:flutter_app/src/features/login/presentation/pages/login_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_app/src/core/util/theme.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AppState();
  }
}

class _AppState extends State<App> {
  // Adding English and Arabic support.
  var supportedLocales = [const Locale('en', ''), const Locale('ar', '')];
  var themeController = GetIt.I<ThemeController>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // set preferred theme at startup.
    themeController?.getThemeModePreferences();
    return GetMaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: supportedLocales,
      title: 'Demo App',
      home: SafeArea(
        child: LoginPage(),
      ),
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      // Use ThemeMode to specify the default/launcher theme.
      themeMode: themeController?.themeMode ?? ThemeMode.system,
    );
  }
}
