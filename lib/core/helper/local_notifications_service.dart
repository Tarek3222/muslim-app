// ignore_for_file: use_build_context_synchronously
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class LocalNotificationsService {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  static StreamController<NotificationResponse> notificationStreamController =
      StreamController<
          NotificationResponse>(); // to handle tap on notification and ui is listening to it
  static onTap(NotificationResponse notificationResponse) {
    notificationStreamController.add(notificationResponse);
  }

  static void dispose() {
    notificationStreamController.close();
  }

  // initialize
  static Future init() async {
    InitializationSettings settings = const InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      iOS: DarwinInitializationSettings(),
    );
    await flutterLocalNotificationsPlugin.initialize(
      settings,
      onDidReceiveNotificationResponse: onTap,
      onDidReceiveBackgroundNotificationResponse: onTap,
    );
  }

// Request Permission when initializing app
  static Future<void> requestPermissionInitial() async {
    // For Android 13+
    if (await Permission.notification.isDenied) {
      await Permission.notification.request();
    }
  }

  // Request Permission
  static Future<void> requestPermission(BuildContext context) async {
    // For Android 13+
    PermissionStatus status = await Permission.notification.request();

    if (status.isDenied) {
      // If denied, show dialog with instructions
      _showSettingsDialog(context);
    } else if (status.isPermanentlyDenied) {
      // If permanently denied, direct to settings
      _showSettingsDialog(context, permanentlyDenied: true);
    }
  }

  static void _showSettingsDialog(BuildContext context,
      {bool permanentlyDenied = false}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Enable Notifications"),
        content: Text(permanentlyDenied
            ? "Notifications are disabled permanently. Please go to settings to enable them."
            : "You have denied notifications. Would you like to enable them in settings?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(context);
              await openAppSettings(); // Opens the app settings screen
            },
            child: const Text("Open Settings"),
          ),
        ],
      ),
    );
  }

  static Future<void> scheduleNotification({
    required int id,
    required String title,
    required String body,
    required int hour,
    required int minute,
  }) async {
    tz.initializeTimeZones(); // Ensure time zones are initialized

    final now = DateTime.now();
    final scheduledDate = tz.TZDateTime.from(
      DateTime(now.year, now.month, now.day, hour, minute),
      tz.local,
    );

    // If the time has already passed today, schedule for tomorrow
    final adjustedTime = scheduledDate.isBefore(now)
        ? scheduledDate.add(const Duration(days: 1))
        : scheduledDate;

    await flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      adjustedTime.subtract(const Duration(minutes: 1)),
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'daily_channel',
          'Daily Notifications',
          importance: Importance.max,
          priority: Priority.high,
        ),
      ),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      matchDateTimeComponents: DateTimeComponents.time, // Repeat daily
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  //! Schedule a notification to be shown at a specific time
  static Future<void> scheduleDailyNotification() async {
    tz.initializeTimeZones(); // Ensure time zones are initialized
    var currentTime = DateTime.now();
    var scheduledTime = tz.TZDateTime.from(
        DateTime(currentTime.year, currentTime.month, currentTime.day, 16),
        tz.local);
    var adjustedTime = scheduledTime.isBefore(currentTime)
        ? scheduledTime.add(const Duration(days: 1))
        : scheduledTime;
    await flutterLocalNotificationsPlugin.zonedSchedule(
      4,
      'Daily Notification',
      'This is a daily notification',
      adjustedTime,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'daily_channel',
          'Daily Notifications',
          importance: Importance.max,
          priority: Priority.high,
        ),
      ),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  // Cancel Notification
  static void cancelNotification(int id) async {
    await flutterLocalNotificationsPlugin.cancel(id);
  }

  static void cancelAllNotification() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }
}

// Steps
// 1) Setup  [Done]
// 2) Basic Notification [Done]
// 4) Repeating Notification [Done]
// 3) Scheduled Notification [Done]
