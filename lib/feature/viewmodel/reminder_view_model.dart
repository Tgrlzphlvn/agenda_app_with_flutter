import 'package:agenda_app_with_flutter/core/notification/local_notification.dart';
import 'package:agenda_app_with_flutter/feature/manager/cache_protocol.dart';
import 'package:agenda_app_with_flutter/feature/model/reminder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class ReminderViewModel extends ChangeNotifier {
  LocalNotification localNotification = LocalNotification();

  late CacheProtocol<Reminder> reminderCache;

  List<Reminder>? reminders = [];
  DateTime date = DateTime.now();

  ReminderViewModel(this.reminderCache) {
    getCacheDatas();
  }

  void changeDate(DateTime selectedDate) {
    date = selectedDate;
    notifyListeners();
  }

  Future<void> startScheduledNotification() async {
    await localNotification.init();
    if (reminders?.isNotEmpty ?? false) {
      for (Reminder reminder in reminders!) {
        if (DateTime.now().isBefore(reminder.alarmTime)) {
          await localNotification.scheduledNotification(
              reminder.description, reminder.alarmTime);
        }
      }
    }
    notifyListeners();
  }

  Future<void> periodicNotification(
      String body, RepeatInterval notificationLayout) async {
    await localNotification.init();
    await localNotification.periodicScheduledNotification(body, notificationLayout);
  }

  // Reminder Cache Functions

  Future<void> getCacheDatas() async {
    await reminderCache.init();
    reminders = reminderCache.getModel();
    notifyListeners();
  }

  Future<void> addReminder(Reminder model) async {
    await reminderCache.addModel(model);
    notifyListeners();
  }

  Future<void> deleteReminder(Reminder model) async {
    await reminderCache.deleteModel(model);
    notifyListeners();
  }
}
