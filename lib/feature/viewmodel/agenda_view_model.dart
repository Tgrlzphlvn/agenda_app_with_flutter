import 'package:agenda_app_with_flutter/feature/manager/cache_protocol.dart';
import 'package:agenda_app_with_flutter/feature/model/doviz.dart';
import 'package:agenda_app_with_flutter/feature/model/historyInToday.dart';
import 'package:agenda_app_with_flutter/feature/service/service_protocol.dart';
import 'package:flutter/cupertino.dart';

class AgendaViewModel extends ChangeNotifier {
  late ServiceProtocol economicValuesProtocol;
  late ServiceProtocol historyInTodayProtocol;
  late CacheProtocol<Tarihtebugun> historyInTodayCache;

  DateTime selectedDateTime = DateTime.now();
  Doviz? exchangeRates;
  List<Tarihtebugun>? historyInToday = [];

  bool isLoading = false;

  AgendaViewModel(this.economicValuesProtocol, this.historyInTodayProtocol,
      this.historyInTodayCache) {
    getExchangeRates();
    getHistoryInToday();
    getHistoryInTodayCacheDatas();
  }

  void changeLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  Future<void> getHistoryInTodayCacheDatas() async {
    await historyInTodayCache.init();
    historyInToday = historyInTodayCache.getModel()!.cast<Tarihtebugun>();
    notifyListeners();
  }

  Future<void> getExchangeRates() async {
    changeLoading();
    exchangeRates = await economicValuesProtocol.fetchValues();
    changeLoading();
    notifyListeners();
  }

  Future<void> getHistoryInToday() async {
    await historyInTodayCache.init();
    changeLoading();
    if (historyInToday?.isEmpty ?? false) {
      await historyInTodayCache.addList(await historyInTodayProtocol.fetchValues());
      if (historyInToday?.isNotEmpty ??
          true && DateTime.now().day != int.parse(historyInToday![0].gun!)) {
        Future.delayed(const Duration(milliseconds: 1), _downloadDatas);
      }
    }
    changeLoading();
    notifyListeners();
  }

  Future<void> _downloadDatas() async {
    await historyInTodayCache.clearCache();
    await historyInTodayCache.addList(await historyInTodayProtocol.fetchValues());
  }

  void chosenDate(DateTime data) {
    selectedDateTime = data;
    notifyListeners();
  }
}
