import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class LocalNotification {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  LocalNotification() {
    init();
  }

  Future<void> init() async {
    const IOSInitializationSettings iOS = IOSInitializationSettings();

    const InitializationSettings initializationSettings =
        InitializationSettings(iOS: iOS);

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
    );

    tz.initializeTimeZones();
    tz.setLocalLocation(tz.getLocation('Europe/Istanbul'));
  }

  Future<void> scheduledNotification(String description, DateTime initTime) async {
    const ios = IOSNotificationDetails();
    const notificationDetails = NotificationDetails(iOS: ios);

    await flutterLocalNotificationsPlugin.zonedSchedule(0, 'Anımsatıcı', description,
        tz.TZDateTime.from(initTime, tz.local), notificationDetails,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        androidAllowWhileIdle: true);
  }

  Future<void> periodicScheduledNotification(
      String body, RepeatInterval notificationLayout) async {
    const ios = IOSNotificationDetails();
    const notificationDetails = NotificationDetails(iOS: ios);

    await flutterLocalNotificationsPlugin.periodicallyShow(
        1, 'Anımsatıcı', body, notificationLayout, notificationDetails);
  }
}
