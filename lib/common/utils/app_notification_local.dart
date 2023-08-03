import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

import 'app_log.dart';

class AppNotificationConstants {
  static const int standUpId = 0;
  static const int sleep = 300;
  static const int cye = 100;
  static const int drinkWater = 200;
  static const int quoteId = 500;
  static const String iconPath = "@mipmap/ic_launcher";
  static const String notificationChannelName = "Base App";
  static const String notificationId = "base_app_notiId";
  static const String notification = "Base App Notifications";
  static const String notificationDes = "Base App Notifications Des";
}

class AppNotificationLocal {
  static final AppNotificationLocal _notificationService = AppNotificationLocal._internal();

  factory AppNotificationLocal() {
    return _notificationService;
  }

  AppNotificationLocal._internal();

  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static Future<ByteArrayAndroidBitmap> getImageBytes(String imageUrl) async {
    final bytes = (await rootBundle.load(imageUrl)).buffer.asUint8List();
    final androidBitMap = ByteArrayAndroidBitmap.fromBase64String(base64.encode(bytes));
    return androidBitMap;
  }

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
          icon: androidIconPath ?? AppNotificationConstants.iconPath,
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
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
    );

    AppLog.info('-------Notification Added with ID: $notiId--------');
  }

  static Future<void> cancelScheduleNotification(int notiId) async {
    await flutterLocalNotificationsPlugin.cancel(notiId);
    AppLog.info("-------Notification removed with ID: $notiId-------");
  }

  static onDidReceiveLocalNotification(i1, s1, s2, s3) {}

  static void initNotificationLocal() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings(AppNotificationConstants.iconPath);
    const DarwinInitializationSettings initializationSettingsIOS = DarwinInitializationSettings(
      onDidReceiveLocalNotification: onDidReceiveLocalNotification,
    );
    const InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: onTapNotification,
    );
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

  tz.TZDateTime _nextInstanceOfHourInDay(int day, int hour) {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduledDate = tz.TZDateTime(tz.local, now.year, now.month, day, hour);
    return scheduledDate.subtract(const Duration(hours: 7)); // chuyển về múi giờ Việt Nam
  }

  void initNotificationAlarm8() {
    tz.initializeTimeZones();

    for (int i = 1; i < 32; i++) {
      // flutterLocalNotificationsPlugin.zonedSchedule(
      //   356 + i, // <---- id
      //   AppNotificationConstants.notification, // <---- title
      //   "Test Notification", // <---- content
      //   _nextInstanceOfHourInDay(i, 8),
      //   NotificationDetails(
      //     android: AndroidNotificationDetails(
      //       'travel_weather_num_$i',
      //       'Daily Travel Weather Notifications',
      //       channelDescription: 'Daily Travel Weather Notifications Des',
      //       icon: 'noti_default_mini',
      //     ),
      //   ),
      //   androidAllowWhileIdle: true,
      //   matchDateTimeComponents: DateTimeComponents.dayOfMonthAndTime,
      //   uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
      // );

      setupNotification(
        notiId: 356 + i,
        title: AppNotificationConstants.notification,
        content: "Test Notification",
        scheduleDateTime: _nextInstanceOfHourInDay(i, 8),
      );
    }
  }

  Future<bool?> requestPermissionNotification() async {
    /// Android 13+
    if (Platform.isAndroid) {
      final AndroidFlutterLocalNotificationsPlugin? androidImplementation =
          flutterLocalNotificationsPlugin
              .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();

      final bool? grantedNotificationPermission = await androidImplementation?.requestPermission();

      return grantedNotificationPermission;
    } else {
      /// Pod install permission notification
      final bool? result = await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<IOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(
            alert: true,
            badge: true,
            sound: true,
          );

      return result;
    }
  }

  Future<void> showNotification({
    int notificationId = 0,
    String notificationTitle = 'Notification title',
    String notificationBody = 'Notification body',
  }) async {
    const AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
      AppNotificationConstants.notificationId,
      AppNotificationConstants.notificationChannelName,
      channelDescription: AppNotificationConstants.notificationDes,
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
    );

    const NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);

    await flutterLocalNotificationsPlugin.show(
      notificationId,
      notificationTitle,
      notificationBody,
      notificationDetails,
      payload: 'item x',
    );
  }
}
