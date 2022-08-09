import 'package:agenda_app_with_flutter/feature/manager/cache_protocol.dart';
import 'package:agenda_app_with_flutter/feature/model/income.dart';
import 'package:agenda_app_with_flutter/product/constants/project_constants.dart';
import 'package:hive_flutter/hive_flutter.dart';

class BalanceCache extends CacheProtocol<Income> {
  BalanceCache(super.key);

  @override
  void registerAdapters() {
    if (!Hive.isAdapterRegistered(ProjectConstants.hiveIncomeId)) {
      Hive.registerAdapter(IncomeAdapter());
    }
  }

  @override
  Future<void> addModel(Income model) async {
    await box?.put(model.id, model);
  }

  @override
  Future<void> deleteModel(Income model) async {
    await box?.delete(model.id);
  }

  @override
  List<Income>? getModel() {
    return box?.values.toList();
  }

  @override
  Future<void> addList(List model) {
    // TODO: implement addList
    throw UnimplementedError();
  }
}
