// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'historyInToday.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TarihtebugunAdapter extends TypeAdapter<Tarihtebugun> {
  @override
  final int typeId = 2;

  @override
  Tarihtebugun read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Tarihtebugun(
      gun: fields[0] as String?,
      ay: fields[1] as String?,
      yil: fields[2] as String?,
      durum: fields[3] as String?,
      olay: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Tarihtebugun obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.gun)
      ..writeByte(1)
      ..write(obj.ay)
      ..writeByte(2)
      ..write(obj.yil)
      ..writeByte(3)
      ..write(obj.durum)
      ..writeByte(4)
      ..write(obj.olay);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TarihtebugunAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HistoryInToday _$HistoryInTodayFromJson(Map<String, dynamic> json) => HistoryInToday(
      success: json['success'] as bool?,
      status: json['status'] as String?,
      pagecreatedate: json['pagecreatedate'] as String?,
      tarihtebugun: (json['tarihtebugun'] as List<dynamic>?)
          ?.map((e) => Tarihtebugun.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Tarihtebugun _$TarihtebugunFromJson(Map<String, dynamic> json) => Tarihtebugun(
      gun: json['Gun'] as String?,
      ay: json['Ay'] as String?,
      yil: json['Yil'] as String?,
      durum: json['Durum'] as String?,
      olay: json['Olay'] as String?,
    );
