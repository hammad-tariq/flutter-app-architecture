import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/cupertino.dart';
import 'abstract_logger.dart';

class FirebaseLogger extends AbstractLogger {
  late final FirebaseCrashlytics _crashlytics;

  FirebaseLogger() {
    _crashlytics = FirebaseCrashlytics.instance;
  }

  @override
  void d(String message) {
    _crashlytics.log('(D) $message');
  }

  @override
  void e(Object error) {
    _crashlytics.recordFlutterError(FlutterErrorDetails(exception: error));
  }

  @override
  void w(String message) {
    _crashlytics.log('(W) $message');
  }
}
