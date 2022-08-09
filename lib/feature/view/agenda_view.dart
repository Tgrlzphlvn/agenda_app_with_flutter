import 'package:agenda_app_with_flutter/feature/model/historyInToday.dart';
import 'package:agenda_app_with_flutter/feature/viewmodel/agenda_view_model.dart';
import 'package:agenda_app_with_flutter/product/constants/project_constants.dart';
import 'package:agenda_app_with_flutter/product/constants/project_paddings.dart';
import 'package:agenda_app_with_flutter/product/theme/dark_theme.dart';
import 'package:agenda_app_with_flutter/product/widget/economic_value_card.dart';
import 'package:agenda_app_with_flutter/product/widget/historyInToday_card.dart';
import 'package:agenda_app_with_flutter/product/widget/horizontal_calendar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AgendaView extends StatelessWidget with ProjectConstants, ProjectPaddings {
  AgendaView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _agendaViewAppBar(context),
      body: Column(
        children: [
          HorizontalCalendar(
            selectedDate: context.read<AgendaViewModel>().selectedDateTime,
            onDateSelected: (data) =>
                context.read<AgendaViewModel>().chosenDate(data),
          ),
          Expanded(flex: 1, child: _economicValuesList(context)),
          Padding(
            padding: EdgeInsets.all(padding5),
            child: Text(historyInTodayAgendaViewTitle),
          ),
          Expanded(flex: 4, child: _historyInTodayList(context)),
        ],
      ),
    );
  }

  AppBar _agendaViewAppBar(BuildContext context) {
    return AppBar(
      title: Text(
        mainTitle,
        style: DarkTheme().darkTheme.textTheme.headline5,
      ),
    );
  }

  SizedBox _economicValuesList(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * widgetSize012,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          EconomicValueCard(
              dovizName: usDollar,
              doviz: context.watch<AgendaViewModel>().exchangeRates?.uSD?.alis ??
                  nullNumbers),
          EconomicValueCard(
              dovizName: euro,
              doviz: context.watch<AgendaViewModel>().exchangeRates?.eUR?.alis ??
                  nullNumbers),
          EconomicValueCard(
              dovizName: bitcoin,
              doviz: context.watch<AgendaViewModel>().exchangeRates?.bTC?.alis ??
                  nullNumbers),
          EconomicValueCard(
              dovizName: etherium,
              doviz: context.watch<AgendaViewModel>().exchangeRates?.eTH?.alis ??
                  nullNumbers),
          EconomicValueCard(
              doviz: context.watch<AgendaViewModel>().exchangeRates?.gA?.alis ??
                  nullNumbers,
              dovizName: gramAltin),
          EconomicValueCard(
              doviz: context.watch<AgendaViewModel>().exchangeRates?.gBP?.alis ??
                  nullNumbers,
              dovizName: sterlin),
        ],
      ),
    );
  }

  Widget _historyInTodayList(BuildContext context) {
    return ListView.builder(
      itemCount: context.watch<AgendaViewModel>().historyInToday?.length ?? 0,
      itemBuilder: (context, index) {
        return HistoryInTodayCard(
          historyInToday: context.read<AgendaViewModel>().historyInToday?[index] ??
              Tarihtebugun(),
        );
      },
    );
  }
}
