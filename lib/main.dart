import 'dart:async';
import 'dart:convert';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/src/core/app.dart';
import 'package:flutter_app/src/core/di/injection_container.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

showNotification() async {
  var android = AndroidNotificationDetails('id', 'notification_app_channel ',
      priority: Priority.high,
      importance: Importance.max,
      setAsGroupSummary: true);

  var iOS = IOSNotificationDetails();
  var notificationDetail =
      new NotificationDetails(android: android, iOS: iOS, macOS: null);
  await flutterLocalNotificationsPlugin.show(
      123, 'Test App', "Notification Title", notificationDetail,
      payload: jsonEncode("Notification pojo class"));
}

Future<void> _firebaseMessagingBackgroundHandler(
    RemoteMessage remoteMessage) async {
  print("Push Notification Data: ${remoteMessage.data}");

  if (remoteMessage.data != null) {
    remoteMessage.data.forEach((dynamicKey, dynamicValue) {
      if (dynamicKey == "message") {
        // Parse notification like below
        // PushRequest.Message message =
        // PushRequest.Message.fromJson(jsonDecode(dynamicValue.toString()));
        //
        // call show notification.
      }
    });
  } else {
    print('Notification Message is null.');
  }
}

/// Create a [AndroidNotificationChannel] for heads up notifications
const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications',
  importance: Importance.high,
);

_initNotificationChannel() async {
  /// Create an Android Notification Channel.
  ///
  /// We use this channel in the `AndroidManifest.xml` file to override the
  /// default FCM channel to enable heads up notifications.
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  /// Update the iOS foreground notification presentation options to allow
  /// heads up notifications.
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
}

Future<dynamic> _onSelectNotification(String payloadNotification) {
  print("Notification selected.");

  WidgetsBinding.instance.addPostFrameCallback((_) {
    if (payloadNotification != null && payloadNotification != "") {
      print(payloadNotification);

      // parse notification content like this.
      // PushRequest.Message message =
      // PushRequest.Message.fromJson(jsonDecode(payloadNotification));
      //
    }
  });
  return null;
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  String initialRoute = 'appPage';
  // allow only portrait mode.
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) async {
    await initDI();

    // For handling notification when the app is in terminated state
    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage message) {
      if (message != null) {
        print('FirebaseMessaging getInitialMessage() is called.');
        if (message.data != null) {
          message.data.forEach((dynamicKey, dynamicValue) {
            if (dynamicKey == "message" && dynamicValue != null) {
              // Parse notification like this.
              // PushRequest.Message message = PushRequest.Message.fromJson(
              //     jsonDecode(dynamicValue.toString()));
              // payLoad = jsonEncode(message);
              //
            }
          });
        } else {
          print('RemoteMessage.data is null.');
        }
      }
    });

    var initializationSettingsAndroid =
        AndroidInitializationSettings('launch_background');
    var initializationSettingsIOs = IOSInitializationSettings();
    var initSetttings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOs);

    flutterLocalNotificationsPlugin.initialize(initSetttings,
        onSelectNotification: _onSelectNotification);

    _initNotificationChannel();

    // Set the background messaging handler early on, as a named top-level function
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    FirebaseMessaging.onMessage.listen((RemoteMessage remoteMessage) {
      print('Got a message whilst in the foreground: ' +
          remoteMessage.data.toString());

      if (remoteMessage.data != null) {
        remoteMessage.data.forEach((dynamicKey, dynamicValue) {
          if (dynamicKey == "message" && dynamicValue != null) {
            // Parse notification data like this.
            // PushRequest.Message message = PushRequest.Message.fromJson(
            //     jsonDecode(dynamicValue.toString()));
            //
          }
        });
      } else {
        print('RemoteMessage.data is null.');
      }

      if (remoteMessage.notification != null) {
        print(
            'Message also contained a notification: ${remoteMessage.notification.body}');
        print('Apple notification: ${remoteMessage.notification.apple}');
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((remoteMessage) {
      print('Message clicked!');
      if (remoteMessage != null && remoteMessage.data != null) {
        if (remoteMessage.data != null) {
          remoteMessage.data.forEach((dynamicKey, dynamicValue) {
            if (dynamicKey == "message" && dynamicValue != null) {
              // Parse notification data like this.
              //   PushRequest.Message message = PushRequest.Message.fromJson(
              //       jsonDecode(dynamicValue.toString()));
              // }
            }
          });
        }
      }
    });

    final NotificationAppLaunchDetails notificationAppLaunchDetails =
        await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();

    if (notificationAppLaunchDetails?.didNotificationLaunchApp == true) {
      if (notificationAppLaunchDetails.payload != null &&
          notificationAppLaunchDetails.payload.isNotEmpty) {
        // payLoad = notificationAppLaunchDetails.payload;
      }
    }

    runZonedGuarded(() {
      runApp(MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: initialRoute,
        routes: {'appPage': (context) => App()},
      ));
    }, FirebaseCrashlytics.instance.recordError);
  });
}
