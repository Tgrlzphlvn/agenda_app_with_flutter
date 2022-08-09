import 'package:agenda_app_with_flutter/product/constants/project_constants.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';

part 'daily.g.dart';

@HiveType(typeId: ProjectConstants.hivedailyId)
class Daily {
  @HiveField(0)
  final String? id;
  @HiveField(1)
  String description;
  @HiveField(2)
  final DateTime createdTime;

  Daily({
    this.id,
    required this.description,
    required this.createdTime,
  });

  factory Daily.create(
      {required String description, required DateTime createdTime}) {
    return Daily(
      id: const Uuid().v1(),
      description: description,
      createdTime: createdTime,
    );
  }
}
