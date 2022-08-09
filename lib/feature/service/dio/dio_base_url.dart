import 'package:dio/dio.dart';

class DioBaseUrl {
  static Dio economicValuesService = Dio(BaseOptions(baseUrl: 'https://api.genelpara.com/embed/'));

  static Dio historyInTodayService = Dio(BaseOptions(baseUrl: 'https://api.ubilisim.com/'));
}
