import 'package:agenda_app_with_flutter/feature/manager/dailyCache/daily_cache.dart';
import 'package:agenda_app_with_flutter/feature/manager/historyInTodayCache/history_in_today_cache.dart';
import 'package:agenda_app_with_flutter/feature/manager/incomeExpenseCache/balance_cache.dart';
import 'package:agenda_app_with_flutter/feature/manager/incomeExpenseCache/expense_cache.dart';
import 'package:agenda_app_with_flutter/feature/manager/incomeExpenseCache/income_cache.dart';
import 'package:agenda_app_with_flutter/feature/manager/reminderCache/reminder_cache.dart';
import 'package:agenda_app_with_flutter/feature/service/dio/dio_base_url.dart';
import 'package:agenda_app_with_flutter/feature/service/economicValues/economic_values_service.dart';
import 'package:agenda_app_with_flutter/feature/service/historyInToday/history_in_today_service.dart';
import 'package:agenda_app_with_flutter/feature/view/navBar/navbar_view.dart';
import 'package:agenda_app_with_flutter/feature/viewmodel/agenda_view_model.dart';
import 'package:agenda_app_with_flutter/feature/viewmodel/daily_view_model.dart';
import 'package:agenda_app_with_flutter/feature/viewmodel/income_expense_view_model.dart';
import 'package:agenda_app_with_flutter/feature/viewmodel/reminder_view_model.dart';
import 'package:agenda_app_with_flutter/product/constants/project_constants.dart';
import 'package:agenda_app_with_flutter/product/theme/dark_theme.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

void main() async {
  await Hive.initFlutter();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<AgendaViewModel>(
      create: (context) => AgendaViewModel(
        EconomicValuesService(DioBaseUrl.economicValuesService),
        HistoryInTodayService(DioBaseUrl.historyInTodayService),
        HistoryInTodayCache(ProjectConstants.historyInTodayHiveKey),
      ),
    ),
    ChangeNotifierProvider<DailyViewModel>(
      create: (context) => DailyViewModel(
        DailyCache(ProjectConstants.dailyHiveKey),
      ),
    ),
    ChangeNotifierProvider<IncomeExpenseViewModel>(
      create: (context) => IncomeExpenseViewModel(
        IncomeCache(ProjectConstants.incomeHiveKey),
        ExpenseCache(ProjectConstants.expenseHiveKey),
        BalanceCache(ProjectConstants.balanceHiveKey),
      ),
    ),
    ChangeNotifierProvider<ReminderViewModel>(
      create: (context) => ReminderViewModel(
        ReminderCache(ProjectConstants.reminderHiveKey),
      ),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: ProjectConstants.appTitle,
      theme: DarkTheme().darkTheme,
      home: NavbarView(),
    );
  }
}
