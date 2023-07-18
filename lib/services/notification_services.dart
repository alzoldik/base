import 'dart:convert';

import 'package:base/utility/route.dart';
import 'package:base/utility/utility.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../feature/main_page.dart';

Future<void> handelBackgroundMessage(RemoteMessage remoteMessage) async {
  cprint("title: ${remoteMessage.notification?.title}");
  cprint("title: ${remoteMessage.notification?.body}");
  cprint("title: ${remoteMessage.data}");
  await Firebase.initializeApp();
  await NotificationServices().initPushNot();
}

class NotificationServices {
  final _firebaseMessaging = FirebaseMessaging.instance;
  final channel = const AndroidNotificationChannel(
    'high_importance_channel',
    'channel_name',
    description: 'channel_description',
    importance: Importance.defaultImportance,
  );
  final _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    await _firebaseMessaging.requestPermission();
    final token = await _firebaseMessaging.getToken();
    cprint('FirebaseMessaging token: $token', event: 'FirebaseMessaging');
    initPushNot();
  }

  Future initPushNot() async {
    await _firebaseMessaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    FirebaseMessaging.instance.getInitialMessage().then(handelMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(handelMessage);
    FirebaseMessaging.onMessage.listen(
      (message) {
        final notification = message.notification;
        if (notification == null) return;
        _flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title != null ? utf8convert(notification.title!) : "",
          notification.body != null ? utf8convert(notification.body!) : "",
          const NotificationDetails(
            android: AndroidNotificationDetails(
              'high_importance_channel',
              'channel_name',
              channelDescription: 'channel_description',
              icon: "@mipmap/ic_launcher",
            ),
            iOS: DarwinNotificationDetails(
              presentAlert: true,
              presentBadge: true,
              presentSound: true,
            ),
          ),
          payload: jsonEncode(message.toMap()),
        );
      },
    );
  }

  Future initLocalNote() async {
    const ios = DarwinInitializationSettings();
    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    const initSet = InitializationSettings(iOS: ios, android: android);
    _flutterLocalNotificationsPlugin.initialize(
      initSet,
      onDidReceiveNotificationResponse: (v) {},
      onDidReceiveBackgroundNotificationResponse: (details) {},
    );
  }

  void handelMessage(RemoteMessage? data) {
    if (data != null) {
      push(MainPage(title: data.notification?.title ?? ""));
    }
  }

  String utf8convert(String text) {
    try {
      return utf8.fuse(base64).decode(Uri.decodeFull(text));
    } catch (e) {
      return text;
    }
  }
}
