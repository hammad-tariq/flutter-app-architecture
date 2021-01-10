import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/src/core/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // allow only portrait mode.
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(App());
  });
}
