import 'package:flutter/material.dart';
import 'package:flutter_app/src/features/login/presentation/pages/login_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_app/src/core/theme.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AppState();
  }
}

class _AppState extends State<App> {
  // Adding English and Arabic support.
  var supportedLocales = [const Locale('en', ''), const Locale('ar', '')];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate
        ],
        supportedLocales: supportedLocales,
        title: 'Demo App',
        home: LoginPage(),
        debugShowCheckedModeBanner: false,
        theme: lightTheme);
  }
}
