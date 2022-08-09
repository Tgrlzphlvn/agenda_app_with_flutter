// https://api.genelpara.com/embed/doviz.json

import 'package:agenda_app_with_flutter/feature/model/doviz.dart';
import 'package:dio/dio.dart';

abstract class ServiceProtocol<T> {
  Dio dio;

  ServiceProtocol(
    this.dio,
  );

  Future<T?> fetchValues();
}
