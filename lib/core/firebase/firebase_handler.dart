import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

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

Future<dynamic>? _onSelectNotification(String? payloadNotification) {
  if (kDebugMode) {
    print("Notification selected.");
  }

  WidgetsBinding.instance.addPostFrameCallback((_) {
    if (payloadNotification != null && payloadNotification != "") {
      if (kDebugMode) {
        print(payloadNotification);
      }

      // parse notification content like this.
      // PushRequest.Message message =
      // PushRequest.Message.fromJson(jsonDecode(payloadNotification));
      //
    }
  });
  return null;
}

Future<void> initFirebaseApp() async {
  await Firebase.initializeApp();
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

  // For handling notification when the app is in terminated state
  FirebaseMessaging.instance.getInitialMessage().then((RemoteMessage? message) {
    if (message != null) {
      if (kDebugMode) {
        print('FirebaseMessaging getInitialMessage() is called.');
      }
      message.data.forEach((dynamicKey, dynamicValue) {
        if (dynamicKey == "message" && dynamicValue != null) {
          // Parse notification like this.
          // PushRequest.Message message = PushRequest.Message.fromJson(
          //     jsonDecode(dynamicValue.toString()));
          // payLoad = jsonEncode(message);
          //
        }
      });
    }
  });

  var initializationSettingsAndroid =
      const AndroidInitializationSettings('launch_background');
  var initializationSettingsIOs = const IOSInitializationSettings();
  var initSettings = InitializationSettings(
      android: initializationSettingsAndroid, iOS: initializationSettingsIOs);

  flutterLocalNotificationsPlugin.initialize(initSettings,
      onSelectNotification: _onSelectNotification);

  _initNotificationChannel();

  // Set the background messaging handler early on, as a named top-level function
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  FirebaseMessaging.onMessage.listen((RemoteMessage remoteMessage) {
    if (kDebugMode) {
      print('Got a message whilst in the foreground: ' +
          remoteMessage.data.toString());
    }

    remoteMessage.data.forEach((dynamicKey, dynamicValue) {
      if (dynamicKey == "message" && dynamicValue != null) {
        // Parse notification data like this.
        // PushRequest.Message message = PushRequest.Message.fromJson(
        //     jsonDecode(dynamicValue.toString()));
        //
      }
    });

    if (remoteMessage.notification != null) {
      if (kDebugMode) {
        print(
            'Message also contained a notification: ${remoteMessage.notification?.body}');
      }
      if (kDebugMode) {
        print('Apple notification: ${remoteMessage.notification?.apple}');
      }
    }
  });

  FirebaseMessaging.onMessageOpenedApp.listen((remoteMessage) {
    if (kDebugMode) {
      print('Message clicked!');
    }
    remoteMessage.data.forEach((dynamicKey, dynamicValue) {
      if (dynamicKey == "message" && dynamicValue != null) {
        // Parse notification data like this.
        //   PushRequest.Message message = PushRequest.Message.fromJson(
        //       jsonDecode(dynamicValue.toString()));
        // }
      }
    });
  });

  final NotificationAppLaunchDetails? notificationAppLaunchDetails =
      await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();

  if (notificationAppLaunchDetails?.didNotificationLaunchApp == true) {
    if (notificationAppLaunchDetails?.payload != null) {
      // payLoad = notificationAppLaunchDetails.payload;
    }
  }
}

Future<void> _firebaseMessagingBackgroundHandler(
    RemoteMessage? remoteMessage) async {
  if (remoteMessage?.data != null) {
    remoteMessage?.data.forEach((dynamicKey, dynamicValue) {
      if (dynamicKey == "message") {
        // Parse notification like below
        // PushRequest.Message message =
        // PushRequest.Message.fromJson(jsonDecode(dynamicValue.toString()));
        //
        // call show notification.
      }
    });
  } else {
    if (kDebugMode) {
      print('Notification Message is null.');
    }
  }
}

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

showNotification() async {
  var android = const AndroidNotificationDetails(
      'id', 'notification_app_channel ',
      priority: Priority.high,
      importance: Importance.max,
      setAsGroupSummary: true);

  var iOS = const IOSNotificationDetails();
  var notificationDetail =
      NotificationDetails(android: android, iOS: iOS, macOS: null);
  await flutterLocalNotificationsPlugin.show(
      123, 'DUKKANTEK', "Notification Title", notificationDetail,
      payload: jsonEncode("Notification pojo class"));
}
