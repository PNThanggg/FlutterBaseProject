import 'dart:async';
import 'dart:convert';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:timezone/timezone.dart' as tz;

import 'app_log.dart';

class AppNotificationConstants {
  static const int standUpId = 0;
  static const int sleep = 300;
  static const int cye = 100;
  static const int drinkWater = 200;
  static const int quoteId = 500;
  static const String notificationId = "base_app_notiId";
  static const String notification = "Base App Notifications";
  static const String notificationDes = "Base App Notifications Des";
}

class AppNotificationLocal {
  // static Future<ByteArrayAndroidBitmap> getImageBytes(String imageUrl) async {
  //   final bytes = (await rootBundle.load(imageUrl)).buffer.asUint8List();
  //   final androidBitMap = ByteArrayAndroidBitmap.fromBase64String(base64.encode(bytes));
  //   return androidBitMap;
  // }

  static void setupNotification({
    required String title,
    required String content,
    required tz.TZDateTime scheduleDateTime,
    required int notiId,
    String? androidIconPath,
    AndroidBitmap<Object>? largeIcon,
    DateTimeComponents? matchDateTimeComponents,
    String? payload,
  }) async {
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();

    flutterLocalNotificationsPlugin.zonedSchedule(
        notiId,
        title,
        content,
        scheduleDateTime,
        NotificationDetails(
          android: AndroidNotificationDetails(
            AppNotificationConstants.notificationId,
            AppNotificationConstants.notification,
            channelDescription: AppNotificationConstants.notificationDes,
            icon: androidIconPath ?? "@mipmap/ic_launcher",
            priority: Priority.high,
            importance: Importance.max,
            largeIcon: largeIcon,
          ),
          iOS: const DarwinNotificationDetails(
            presentAlert: true,
            presentBadge: true,
            presentSound: true,
            sound: "default",
          ),
        ),
        payload: payload,
        androidAllowWhileIdle: true,
        matchDateTimeComponents: matchDateTimeComponents ?? DateTimeComponents.dayOfMonthAndTime,
        uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime);
    AppLog.info('-------Notification Added with ID: $notiId--------');
  }

  static Future<void> cancelScheduleNotification(int notiId) async {
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
    await flutterLocalNotificationsPlugin.cancel(notiId);
    AppLog.info("-------Notification removed with ID: $notiId-------");
  }

  static onDidReceiveLocalNotification(i1, s1, s2, s3) {}

  static void initNotificationLocal() async {
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();

    flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>()?.requestPermission();
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const DarwinInitializationSettings initializationSettingsIOS =
        DarwinInitializationSettings(onDidReceiveLocalNotification: onDidReceiveLocalNotification);
    const InitializationSettings initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: onTapNotification);

    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.requestPermission();
  }

  static void onTapNotification(NotificationResponse notificationResponse) {
    final payload = notificationResponse.payload;
    if (payload != null) {
      final data = jsonDecode(payload) as Map<String, dynamic>;
      if (data["route"] != null) {
        Get.toNamed(data["route"] as String);
      }
    }
  }
}
