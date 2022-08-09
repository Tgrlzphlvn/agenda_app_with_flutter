import 'package:agenda_app_with_flutter/feature/manager/cache_protocol.dart';
import 'package:agenda_app_with_flutter/feature/model/reminder.dart';
import 'package:agenda_app_with_flutter/product/constants/project_constants.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ReminderCache extends CacheProtocol<Reminder> {
  ReminderCache(super.key);

  @override
  void registerAdapters() {
    if (!Hive.isAdapterRegistered(ProjectConstants.hiveReminderId)) {
      Hive.registerAdapter(ReminderAdapter());
    }
  }

  @override
  Future<void> addModel(Reminder model) async {
    await box?.put(model.id, model);
  }

  @override
  Future<void> deleteModel(Reminder model) async {
    await box?.delete(model.id);
  }

  @override
  List<Reminder>? getModel() {
    List<Reminder>? _reminders = [];
    _reminders = box?.values.toList();

    if (_reminders != null) {
      _reminders.sort((Reminder a, Reminder b) => b.createdTime!.compareTo(a.createdTime!));
    }
    return _reminders;
  }

  @override
  Future<void> addList(List model) {
    // TODO: implement addList
    throw UnimplementedError();
  }
}
