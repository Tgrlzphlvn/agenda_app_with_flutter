import 'package:agenda_app_with_flutter/product/constants/project_constants.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

part 'income.g.dart';

@HiveType(typeId: ProjectConstants.hiveIncomeId)
class Income {
  @HiveField(0)
  final String? id;
  @HiveField(1)
  final String source;
  @HiveField(2)
  final int income;

  Income({
    this.id,
    required this.source,
    required this.income,
  });

  factory Income.create({required String source, required int income}) {
    return Income(
      id: const Uuid().v1(),
      source: source,
      income: income,
    );
  }
}
