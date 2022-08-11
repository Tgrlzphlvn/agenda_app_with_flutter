import 'package:agenda_app_with_flutter/feature/manager/cache_protocol.dart';
import 'package:agenda_app_with_flutter/feature/model/income.dart';
import 'package:flutter/material.dart';

class IncomeExpenseViewModel extends ChangeNotifier {
  late CacheProtocol<Income> incomeCache;
  late CacheProtocol<Income> expenseCache;
  late CacheProtocol<Income> balanceCache;

  List<Income>? incomes = [];
  List<Income>? expenses = [];
  List<Income>? balances = [];

  int totalIncome = 0;
  int totalExpense = 0;

  String? selectedItem = 'Gelir';

  IncomeExpenseViewModel(this.incomeCache, this.expenseCache, this.balanceCache) {
    getIncomeCacheDatas();
    getExpenseCacheDatas();
    getBalanceCacheDatas();
  }

  void changeItem(String value) {
    selectedItem = value;
    notifyListeners();
  }

  // Income  Methods

  Future<void> getIncomeCacheDatas() async {
    await incomeCache.init();
    incomes = incomeCache.getModel();
    notifyListeners();
  }

  Future<void> deleteIncome(Income income) async {
    await incomeCache.deleteModel(income);
  }

  Future<void> addIncome(Income income) async {
    await incomeCache.addModel(income);
  }

  // Expense Methods

  Future<void> getExpenseCacheDatas() async {
    await expenseCache.init();
    expenses = expenseCache.getModel();
    notifyListeners();
  }

  Future<void> deleteExpense(Income expense) async {
    await expenseCache.deleteModel(expense);
  }

  Future<void> addExpense(Income expense) async {
    await expenseCache.addModel(expense);
  }

  // Balance Methods

  Future<void> getBalanceCacheDatas() async {
    await balanceCache.init();
    totalIncome = 0;
    totalExpense = 0;
    await balanceCache.clearCache();
    await incomeAddBalance();
    await expenseAddBalance();
    balances = balanceCache.getModel();
    notifyListeners();
  }

  Future<void> incomeAddBalance() async {
    totalIncome = 0;
    if (incomes?.isNotEmpty ?? true) {
      for (Income income in incomes!) {
        totalIncome += income.income;
      }
    }

    await balanceCache
        .addModel(Income.create(source: 'Gelirler', income: totalIncome));
    notifyListeners();
  }

  Future<void> expenseAddBalance() async {
    totalExpense = 0;
    if (expenses?.isNotEmpty ?? true) {
      for (Income income in expenses!) {
        totalExpense += income.income;
      }
    }
    await balanceCache
        .addModel(Income.create(source: 'Giderler', income: totalExpense));
    notifyListeners();
  }

  int incomeExpenseAverage() {
    return totalIncome - totalExpense;
  }
}
