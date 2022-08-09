import 'dart:convert';
import 'dart:io';

import 'package:agenda_app_with_flutter/feature/model/doviz.dart';
import 'package:agenda_app_with_flutter/feature/service/service_protocol.dart';

class EconomicValuesService extends ServiceProtocol {
  EconomicValuesService(super.dio);

  @override
  Future<Doviz?> fetchValues() async {
    final request = await dio.get('${_ServicePath.doviz.name}.json');

    if (request.statusCode == HttpStatus.ok) {
      final response = request.data;
      final doviz = Doviz.fromJson(jsonDecode(response));
      return doviz;
    }
    return null;
  }
}

enum _ServicePath {
  doviz,
}
