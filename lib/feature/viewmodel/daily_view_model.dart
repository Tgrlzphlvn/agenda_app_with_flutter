import 'package:agenda_app_with_flutter/feature/manager/cache_protocol.dart';
import 'package:agenda_app_with_flutter/feature/model/daily.dart';
import 'package:flutter/cupertino.dart';

class DailyViewModel extends ChangeNotifier {
  late CacheProtocol<Daily> dailyCache;
  List<Daily>? dailies = [];

  DailyViewModel(this.dailyCache) {
    getCacheDatas();
  }

  Future<void> getCacheDatas() async {
    await dailyCache.init();
    dailies = dailyCache.getModel();
    notifyListeners();
  }

  Future<void> delete(Daily daily) async {
    await dailyCache.deleteModel(daily);
    notifyListeners();
  }

  Future<void> add(Daily daily) async {
    await dailyCache.addModel(daily);
    notifyListeners();
  }
}
