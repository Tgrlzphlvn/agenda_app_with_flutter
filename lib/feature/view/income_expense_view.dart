import 'package:agenda_app_with_flutter/core/components/text_form_field_validator.dart';
import 'package:agenda_app_with_flutter/feature/model/income.dart';
import 'package:agenda_app_with_flutter/feature/viewmodel/income_expense_view_model.dart';
import 'package:agenda_app_with_flutter/product/constants/project_constants.dart';
import 'package:agenda_app_with_flutter/product/constants/project_paddings.dart';
import 'package:agenda_app_with_flutter/product/theme/dark_theme.dart';
import 'package:agenda_app_with_flutter/product/widget/income_expense_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IncomeExpenseView extends StatelessWidget
    with ProjectConstants, ProjectPaddings {
  IncomeExpenseView({Key? key}) : super(key: key);

  TextEditingController incomeController = TextEditingController();
  TextEditingController sourceController = TextEditingController();

  final GlobalKey _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _incomeExpenseAppBar(context),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Padding(
                  padding: EdgeInsets.all(padding10),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: _balanceChartAndList(context),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: _incomeChartAndList(context),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(padding10),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: _expenseChartAndList(context),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Column _balanceChartAndList(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: IncomExpenseChart(
            chartTitle: 'Gelir/Gider Tablosu',
            incomes: context.watch<IncomeExpenseViewModel>().balances ?? [],
          ),
        ),
        Text(
            'Gelir/Gider Durumu : ${context.watch<IncomeExpenseViewModel>().incomeExpenseAverage()} TL'),
        Expanded(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Row(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount:
                        context.watch<IncomeExpenseViewModel>().incomes?.length ?? 0,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        width: MediaQuery.of(context).size.width * 0.45,
                        child: Column(
                          children: [
                            ListTile(
                              leading: Text(context
                                      .read<IncomeExpenseViewModel>()
                                      .incomes?[index]
                                      .source
                                      .toString() ??
                                  ''),
                              trailing: Text(context
                                      .read<IncomeExpenseViewModel>()
                                      .incomes?[index]
                                      .income
                                      .toString() ??
                                  ''),
                            ),
                            const Divider(indent: 10, endIndent: 10),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount:
                        context.watch<IncomeExpenseViewModel>().expenses?.length ??
                            0,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        width: MediaQuery.of(context).size.width * 0.45,
                        child: Column(
                          children: [
                            ListTile(
                              leading: Text(context
                                      .read<IncomeExpenseViewModel>()
                                      .expenses?[index]
                                      .source
                                      .toString() ??
                                  ''),
                              trailing: Text(context
                                      .read<IncomeExpenseViewModel>()
                                      .expenses?[index]
                                      .income
                                      .toString() ??
                                  ''),
                            ),
                            const Divider(indent: 10, endIndent: 10),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Column _incomeChartAndList(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: IncomExpenseChart(
            chartTitle: 'Gelirler',
            incomes: context.watch<IncomeExpenseViewModel>().incomes ?? [],
          ),
        ),
        Text(
            'Toplam Gelir : ${context.watch<IncomeExpenseViewModel>().totalIncome.toString()} TL'),
        Expanded(
          flex: 1,
          child: ListView.builder(
            itemCount: context.watch<IncomeExpenseViewModel>().incomes?.length ?? 0,
            itemBuilder: (context, index) {
              Income income = context.read<IncomeExpenseViewModel>().incomes![index];
              return Column(
                children: [
                  const Divider(),
                  Dismissible(
                    key: Key(income.id ?? nullText),
                    child: ListTile(
                      leading: Text(income.source),
                      trailing: Text(income.income.toString()),
                    ),
                    onDismissed: (direction) {
                      context.read<IncomeExpenseViewModel>().deleteIncome(income);
                      context.read<IncomeExpenseViewModel>().getIncomeCacheDatas();
                      context.read<IncomeExpenseViewModel>().getBalanceCacheDatas();
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }

  Column _expenseChartAndList(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: IncomExpenseChart(
            chartTitle: 'Giderler',
            incomes: context.watch<IncomeExpenseViewModel>().expenses ?? [],
          ),
        ),
        Text(
            'Toplam Gider : ${context.watch<IncomeExpenseViewModel>().totalExpense.toString()} TL'),
        Expanded(
          flex: 1,
          child: ListView.builder(
            itemCount: context.watch<IncomeExpenseViewModel>().expenses?.length ?? 0,
            itemBuilder: (context, index) {
              Income expense =
                  context.read<IncomeExpenseViewModel>().expenses![index];
              return Column(
                children: [
                  const Divider(),
                  Dismissible(
                    key: Key(expense.id ?? nullText),
                    child: ListTile(
                      leading: Text(expense.source),
                      trailing: Text(expense.income.toString()),
                    ),
                    onDismissed: (direction) {
                      context.read<IncomeExpenseViewModel>().deleteExpense(expense);
                      context.read<IncomeExpenseViewModel>().getExpenseCacheDatas();
                      context.read<IncomeExpenseViewModel>().getBalanceCacheDatas();
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }

  AppBar _incomeExpenseAppBar(BuildContext context) {
    return AppBar(
      title: Text(expenses, style: DarkTheme().darkTheme.textTheme.headline5),
      centerTitle: false,
      actions: [
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {
            showModalBottomSheet(
                enableDrag: true,
                isScrollControlled: true,
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(padding20))),
                context: context,
                builder: (context) => _incomeExpenseBottomSheet(context));
          },
        ),
      ],
    );
  }

  SizedBox _incomeExpenseBottomSheet(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2.2 +
          MediaQuery.of(context).viewInsets.bottom,
      child: Form(
        key: _globalKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(padding20),
              child: TextFormField(
                validator: TextFormFielValidator().isNotEmpty,
                enableInteractiveSelection: true,
                autofocus: true,
                textInputAction: TextInputAction.next,
                controller: sourceController,
                decoration: InputDecoration(label: Text(sourceLabel)),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(padding20),
              child: TextFormField(
                validator: TextFormFielValidator().isNotEmpty,
                autofocus: true,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                controller: incomeController,
                decoration: InputDecoration(label: Text(incomeLabel)),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: padding20, left: padding20),
              child: Row(
                children: [
                  Text(dropDownButtonText),
                  const Spacer(),
                  _dropDownButton(context)
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(padding20),
              child: ElevatedButton(
                onPressed: () {
                  if (incomeController.text.isNotEmpty &&
                      sourceController.text.isNotEmpty) {
                    if (context.read<IncomeExpenseViewModel>().selectedItem ==
                        'Gider') {
                      context.read<IncomeExpenseViewModel>().addExpense(
                            Income.create(
                              source: sourceController.text,
                              income: int.parse(incomeController.text),
                            ),
                          );
                      context.read<IncomeExpenseViewModel>().getExpenseCacheDatas();
                      context.read<IncomeExpenseViewModel>().getBalanceCacheDatas();
                    } else {
                      context.read<IncomeExpenseViewModel>().addIncome(
                            Income.create(
                              source: sourceController.text,
                              income: int.parse(incomeController.text),
                            ),
                          );
                      context.read<IncomeExpenseViewModel>().getIncomeCacheDatas();
                      context.read<IncomeExpenseViewModel>().getBalanceCacheDatas();
                    }
                    sourceController.text = nullText;
                    incomeController.text = nullText;
                    Navigator.pop(context);
                  }
                },
                child: Text(bottomSheetSaveButton),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _dropDownButton(BuildContext context) {
    List<String> items = ['Gelir', 'Gider'];

    return DropdownButton<String>(
      value: context.watch<IncomeExpenseViewModel>().selectedItem,
      items: items.map<DropdownMenuItem<String>>((String item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(item),
        );
      }).toList(),
      onChanged: (value) {
        context.read<IncomeExpenseViewModel>().changeItem(value.toString());
      },
    );
  }
}
