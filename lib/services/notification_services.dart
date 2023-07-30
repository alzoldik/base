import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math' as math;
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import '../utility/utility.dart';

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  FirebaseNotifications().setUpFirebase();
  _not = message.data;
  FirebaseNotifications().pushLocalNotification(
    message.notification?.title ?? "",
    message.notification?.body ?? "",
  );
  cprint("Handling a background message: ${message.notification?.toMap()}");
}

Map<String, dynamic> _not = {};

class FirebaseNotifications {
  static FirebaseMessaging? _firebaseMessaging;
  static FlutterLocalNotificationsPlugin? _notificationsPlugin;
  Future<void> setUpFirebase() async {
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
    _firebaseMessaging = FirebaseMessaging.instance;
    _firebaseMessaging?.setAutoInitEnabled(true);
    FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    _notificationsPlugin = FlutterLocalNotificationsPlugin();
    if (Platform.isIOS) {
      _notificationsPlugin
          ?.resolvePlatformSpecificImplementation<
              IOSFlutterLocalNotificationsPlugin>()!
          .requestPermissions(
            alert: true,
            badge: true,
            sound: true,
          );
    }
    var android = const AndroidInitializationSettings('@mipmap/ic_launcher');

    var initSetting = InitializationSettings(
      android: android,
      iOS: const DarwinInitializationSettings(
        defaultPresentAlert: true,
        defaultPresentBadge: true,
        defaultPresentSound: true,
      ),
    );
    _notificationsPlugin?.initialize(
      initSetting,
      onDidReceiveNotificationResponse: onSelectNotification,
    );
    firebaseCloudMessagingListeners();
  }

  Future<void> firebaseCloudMessagingListeners() async {
    iOSPermission();
    await getToken();
    FirebaseMessaging.onMessage.listen(
      (RemoteMessage data) {
        _not = data.data;
        cprint('on Message data ${data.data}');
        cprint('on Message ${jsonEncode(data.notification?.toMap())}');
        if (Platform.isAndroid) {
          pushLocalNotification(
            data.notification?.title ?? "",
            data.notification?.body ?? "",
          );
        }
      },
    );

    FirebaseMessaging.onMessageOpenedApp.listen(
      (RemoteMessage data) {
        cprint('on Opened ${data.data}');
        _not = data.data;
        handlePathByRoute(data.data);
      },
    );

    _notificationsPlugin?.getNotificationAppLaunchDetails().then(
      (
        NotificationAppLaunchDetails? data,
      ) {
        cprint(
            'on Opened From Notification ${data!.notificationResponse?.payload}');
        if (data.notificationResponse?.payload != null) handlePathByRoute(_not);
      },
    );
  }

  static Future<String> getToken() async {
    String? deviceToken = '';
    try {
      deviceToken = await _firebaseMessaging?.getToken();
    } catch (e) {
      cprint("$e");
    }
    cprint("TOKEN: $deviceToken");
    return deviceToken ?? "";
  }

  void iOSPermission() => _firebaseMessaging?.requestPermission(
        announcement: true,
        carPlay: true,
        sound: true,
        badge: true,
        alert: true,
      );

  Future<void> handlePathByRoute(Map<String, dynamic> dataMap) async {
    cprint("data map $dataMap");
  }

  void onSelectNotification(NotificationResponse? payload) async {
    cprint(payload.toString());
    handlePathByRoute(_not);
  }

  Future<void> getInitialMessage() async {
    FirebaseMessaging.instance.getInitialMessage().then(
      (value) {
        if (value != null) {
          _not = value.data;
          handlePathByRoute(value.data);
        }
      },
    );
  }

  pushLocalNotification(String title, String subtitle) async {
    var rng = math.Random();
    var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
      'high_importance_channel',
      'channel_name',
      importance: Importance.high,
      priority: Priority.high,
      ticker: 'ticker',
    );
    var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: const DarwinNotificationDetails(),
    );
    await _notificationsPlugin?.show(
      rng.nextInt(100000),
      Utility.utf8convert(title),
      Utility.utf8convert(subtitle),
      platformChannelSpecifics,
      payload: 'item x',
    );
  }
}
