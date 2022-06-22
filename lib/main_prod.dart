import 'dart:async';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'app_parent_widget.dart';
import 'core/bloc/bloc_observer.dart';
import 'core/di/injection_container.dart';
import 'config/flavors.dart';
import 'core/firebase/firebase_notification_handler.dart';

void main() async {
  F.appFlavor = Flavor.prod;
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  runZonedGuarded(() async {
    await BlocOverrides.runZoned(
      () async {
        initDI();
        WidgetsFlutterBinding.ensureInitialized();
        await initFirebaseApp();
        FlutterError.onError = (FlutterErrorDetails details) {
          FlutterError.presentError(details);
        };
        runApp(
          const AppParentWidget(),
        );
      },
      blocObserver: CubitObserver(),
    );
  }, (error, stackTrace) {

  });
}
