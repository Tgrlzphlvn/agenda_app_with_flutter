import 'package:agenda_app_with_flutter/feature/manager/cache_protocol.dart';
import 'package:agenda_app_with_flutter/feature/model/historyInToday.dart';
import 'package:agenda_app_with_flutter/product/constants/project_constants.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HistoryInTodayCache extends CacheProtocol<Tarihtebugun> {
  HistoryInTodayCache(super.key);

  @override
  void registerAdapters() {
    if (!Hive.isAdapterRegistered(ProjectConstants.hiveTarihteBugunId)) {
      Hive.registerAdapter(TarihtebugunAdapter());
    }
  }

  @override
  Future<void> addList(List<Tarihtebugun> model) async {
    await box?.addAll(model);
  }

  @override
  List<Tarihtebugun>? getModel() {
    List<Tarihtebugun>? model = box?.values.toList();
    return model;
  }

  @override
  Future<void> addModel(model) async {
    // TODO: implement addModel
    throw UnimplementedError();
  }

  @override
  Future<void> deleteModel(model) async {
    // TODO: implement deleteModel
    throw UnimplementedError();
  }
}
