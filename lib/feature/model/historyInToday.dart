import 'package:agenda_app_with_flutter/product/constants/project_constants.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'historyInToday.g.dart';

@JsonSerializable(createToJson: false)
class HistoryInToday {
  bool? success;
  String? status;
  String? pagecreatedate;
  List<Tarihtebugun>? tarihtebugun;

  HistoryInToday(
      {this.success, this.status, this.pagecreatedate, this.tarihtebugun});

  factory HistoryInToday.fromJson(Map<String, dynamic> json) {
    return _$HistoryInTodayFromJson(json);
  }
}

@HiveType(typeId: ProjectConstants.hiveTarihteBugunId)
@JsonSerializable(createToJson: false)
class Tarihtebugun {
  @HiveField(0)
  String? gun;
  @HiveField(1)
  String? ay;
  @HiveField(2)
  String? yil;
  @HiveField(3)
  String? durum;
  @HiveField(4)
  String? olay;

  Tarihtebugun({this.gun, this.ay, this.yil, this.durum, this.olay});

  factory Tarihtebugun.fromJson(Map<String, dynamic> json) {
    return _$TarihtebugunFromJson(json);
  }
}
