import 'package:agenda_app_with_flutter/feature/model/income.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class IncomExpenseChart extends StatelessWidget {
  const IncomExpenseChart({
    Key? key,
    required this.chartTitle,
    required this.incomes,
  }) : super(key: key);

  final String chartTitle;
  final List<Income> incomes;

  @override
  Widget build(BuildContext context) {
    return SfCircularChart(
      title: ChartTitle(text: chartTitle, alignment: ChartAlignment.center),
      legend: Legend(isVisible: true),
      series: <PieSeries<Income, String>>[
        PieSeries<Income, String>(
          explode: true,
          explodeIndex: 0,
          dataSource: incomes,
          xValueMapper: (income, index) => income.source,
          yValueMapper: (income, index) => income.income,
          dataLabelMapper: (income, index) => income.income.toString(),
          dataLabelSettings: const DataLabelSettings(isVisible: true),
        ),
      ],
    );
  }
}
