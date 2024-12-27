import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

Future<void> handleBackGroundMessage(RemoteMessage? message) async {
  if (message == null) return;
}

class FirebaseApi {
  final _firebaseMessing = FirebaseMessaging.instance;

  final _androidChannel = const AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    description: "merry christmas",
    importance: Importance.defaultImportance,
    playSound: true,
  );

  final _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  Future<void> handleMessage(RemoteMessage? message) async {
    if (message == null) return;
  }

  Future initLocalNotification() async {
    // const iOS = IOS();
    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    final settings = InitializationSettings(android: android);

    await _flutterLocalNotificationsPlugin.initialize(
      settings,
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        final payload = response.payload; 
        print("#######################$payload");
        if (payload != null) {
          final message = RemoteMessage.fromMap(jsonDecode(payload));
          handleMessage(message);
        } else {
          print('No payload in notification response');
        }
      },
    );

    final platform =
        _flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>();
    await platform?.createNotificationChannel(_androidChannel);
  }

  Future initPushNotifications() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
    FirebaseMessaging.onBackgroundMessage(handleBackGroundMessage);
    FirebaseMessaging.onMessage.listen((message) {
      final notification = message.notification;
      if (notification == null) return;
      _flutterLocalNotificationsPlugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
              _androidChannel.id, _androidChannel.name,
              channelDescription: _androidChannel.description,
              playSound: _androidChannel.playSound,
              sound: RawResourceAndroidNotificationSound('notification'),
              icon: '@mipmap/ic_launcher'),
        ),
        payload: jsonEncode(message.toMap()),
      );
    });
  }

  Future<void> initNotification() async {
    await _firebaseMessing.requestPermission();
    final fCMToken = await _firebaseMessing.getToken();

    // print('Token : $fCMToken');
    initNotification();
    initLocalNotification();
  }
}
