import 'dart:io';
import 'package:agenda_app_with_flutter/feature/model/historyInToday.dart';
import 'package:agenda_app_with_flutter/feature/service/service_protocol.dart';

class HistoryInTodayService extends ServiceProtocol {
  HistoryInTodayService(super.dio);

  @override
  Future<List<Tarihtebugun>?> fetchValues() async {
    final request = await dio.get(_ServicePath.tarihtebugun.name);

    if (request.statusCode == HttpStatus.ok) {
      final response = request.data;
      final historyInToday = HistoryInToday.fromJson(response);
      return historyInToday.tarihtebugun;
    }
    return null;
  }
}

enum _ServicePath {
  tarihtebugun,
}
