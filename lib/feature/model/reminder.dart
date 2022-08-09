import 'package:agenda_app_with_flutter/core/notification/local_notification.dart';
import 'package:agenda_app_with_flutter/product/constants/project_constants.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';

part 'reminder.g.dart';

@HiveType(typeId: ProjectConstants.hiveReminderId)
class Reminder {
  @HiveField(0)
  final String? id;
  @HiveField(1)
  final String description;
  @HiveField(2)
  final DateTime alarmTime;
  @HiveField(3)
  final DateTime? createdTime;
  @HiveField(4)
  Reminder({
    this.id,
    required this.description,
    required this.alarmTime,
    this.createdTime,
  });

  factory Reminder.create(
      {required String description, required DateTime alarmTime}) {
    return Reminder(
      id: const Uuid().v1(),
      description: description,
      alarmTime: alarmTime,
      createdTime: DateTime.now(),
    );
  }
}
