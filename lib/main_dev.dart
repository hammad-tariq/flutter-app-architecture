import 'dart:async';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'app.dart';
import 'config/env_config.dart';
import 'core/bloc/bloc_observer.dart';
import 'core/di/injection_container.dart';
import 'config/flavors.dart';
import 'core/firebase/firebase_notification_handler.dart';

void main() async {
  F.appFlavor = Flavor.dev;
  GlobalAppConfig(
      appName: "",
      flavorName: F.appFlavor.toString(),
      apiBaseURL: "http://restapi.adequateshop.com/api/authaccount");
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  runZonedGuarded(() async {
    await BlocOverrides.runZoned(
      () async {
        WidgetsFlutterBinding.ensureInitialized();
        initDI();
        await initFirebaseApp();
        FlutterError.onError = (FlutterErrorDetails details) {
          FlutterError.presentError(details);
        };
        runApp(
          // testing repo link.
          App(),
        );
      },
      blocObserver: CubitObserver(),
    );
  }, (error, stackTrace) {
    log("main_dev runZonedGuarded Error: $error");
    log("main_dev runZonedGuarded StackTrace: $stackTrace");
  });
}
