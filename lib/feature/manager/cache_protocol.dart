import 'package:hive_flutter/hive_flutter.dart';

abstract class CacheProtocol<T> {
  String key;
  Box<T>? box;

  CacheProtocol(this.key);

  Future<void> init() async {
    registerAdapters();
    if (!(box?.isOpen ?? false)) {
      box = await Hive.openBox<T>(key);
    } else {
      box = Hive.box<T>(key);
    }
  }

  Future<void> clearCache() async {
    await box?.clear();
  }

  Future<void> addList(List<T> model);

  void registerAdapters();

  Future<void> addModel(T model);

  List<T>? getModel();

  Future<void> deleteModel(T model);
}
