import 'package:firebase_crashlytics/firebase_crashlytics.dart';
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

  Future<void> _initializeFlutterFireFuture;

// Toggle this for testing Crashlytics in your app locally.
  var _kTestingCrashlytics = true;
  var kDebugMode = true;

  @override
  void initState() {
    super.initState();
    _initializeFlutterFireFuture = _initializeFlutterFire();
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
        child: FutureBuilder(
          future: _initializeFlutterFireFuture,
          builder: (context, snapShot) {
            return LoginPage();
          },
        ),
      ),
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      // Use ThemeMode to specify the default/launcher theme.
      themeMode: themeController?.themeMode ?? ThemeMode.system,
    );
  }

  // Define an async function to
  // initialize FlutterFire
  Future<void> _initializeFlutterFire() async {
    // Wait for Firebase to initialize
    if (_kTestingCrashlytics) {
      // Force enable crashlytics collection enabled if we're testing it.
      await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
    } else {
      // Else only enable it in non-debug builds.
      // You could additionally extend this to allow users to opt-in.
      await FirebaseCrashlytics.instance
          .setCrashlyticsCollectionEnabled(!kDebugMode);
    }
    // Pass all uncaught errors to Crashlytics.
    Function originalOnError = FlutterError.onError;
    FlutterError.onError = (FlutterErrorDetails errorDetails) async {
      await FirebaseCrashlytics.instance.recordFlutterError(errorDetails);
      // Forward to original handler.
      originalOnError(errorDetails);
    };
  }
}
