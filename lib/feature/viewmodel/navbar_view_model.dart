import 'package:agenda_app_with_flutter/feature/view/agenda_view.dart';
import 'package:agenda_app_with_flutter/feature/view/daily_view.dart';
import 'package:agenda_app_with_flutter/feature/view/income_expense_view.dart';
import 'package:agenda_app_with_flutter/feature/view/reminder_view.dart';
import 'package:flutter/material.dart';

class NavbarViewModel extends ChangeNotifier {
  int currentIndex = 0;
  final pageList = [AgendaView(), IncomeExpenseView(), DailyView(), ReminderView()];

  void changeIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
