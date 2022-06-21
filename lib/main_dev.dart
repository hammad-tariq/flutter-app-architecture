import 'dart:async';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'app_parent_widget.dart';
import 'config/env_config.dart';
import 'core/bloc/bloc_observer.dart';
import 'core/di/injection_container.dart';
import 'core/firebase/firebase_handler.dart';
import 'config/flavors.dart';

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
          const AppParentWidget(),
        );
      },
      blocObserver: CubitObserver(),
    );
  }, (error, stackTrace) {});
}
