import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/src/core/app.dart';
import 'package:flutter_app/src/core/di/injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // allow only portrait mode.
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) async {
    await initDI();
    runApp(App());
  });
}
