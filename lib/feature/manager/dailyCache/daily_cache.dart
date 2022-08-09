import 'package:agenda_app_with_flutter/feature/manager/cache_protocol.dart';
import 'package:agenda_app_with_flutter/feature/model/daily.dart';
import 'package:agenda_app_with_flutter/product/constants/project_constants.dart';
import 'package:hive/hive.dart';

class DailyCache extends CacheProtocol<Daily> {
  DailyCache(String key) : super(key);

  @override
  void registerAdapters() {
    if (!Hive.isAdapterRegistered(ProjectConstants.hivedailyId)) {
      Hive.registerAdapter(DailyAdapter());
    }
  }

  @override
  Future<void> addModel(Daily model) async {
    await box?.put(model.id, model);
  }

  @override
  Future<void> deleteModel(Daily model) async {
    await box?.delete(model.id);
  }

  @override
  List<Daily>? getModel() {
    List<Daily>? _dailies = [];
    _dailies = box?.values.toList();

    if (_dailies != null) {
      _dailies.sort((Daily a, Daily b) => b.createdTime.compareTo(a.createdTime));
    }
    return _dailies;
  }

  @override
  Future<void> addList(model) {
    // TODO: implement addList
    throw UnimplementedError();
  }
}
