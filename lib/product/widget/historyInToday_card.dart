import 'package:agenda_app_with_flutter/feature/model/historyInToday.dart';
import 'package:agenda_app_with_flutter/product/colors/project_colors.dart';
import 'package:agenda_app_with_flutter/product/constants/project_constants.dart';
import 'package:agenda_app_with_flutter/product/constants/project_paddings.dart';
import 'package:agenda_app_with_flutter/product/theme/dark_theme.dart';
import 'package:flutter/material.dart';

class HistoryInTodayCard extends StatelessWidget
    with ProjectPaddings, DarkThemeColors, ProjectConstants {
  HistoryInTodayCard({Key? key, required this.historyInToday}) : super(key: key);

  final Tarihtebugun historyInToday;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: padding10, right: padding10, bottom: padding10),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(color: Colors.black, blurRadius: 6, spreadRadius: 0.5)
          ],
          color: bdazzledBlue,
          borderRadius: BorderRadius.circular(padding10),
        ),
        child: Padding(
          padding: EdgeInsets.all(padding10),
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(padding5),
                    child: Text(
                      historyInToday.durum ?? nullText,
                      style: TextStyle(color: white, fontSize: 16),
                    ),
                  ),
                ],
              ),
              Text(
                historyInToday.olay ?? nullText,
                style: DarkTheme().darkTheme.textTheme.bodyText1,
              ),
              Row(
                children: [
                  const SizedBox(),
                  const Spacer(),
                  Padding(
                    padding: EdgeInsets.only(top: padding10),
                    child: Text(
                        '${historyInToday.gun}.${historyInToday.ay}.${historyInToday.yil}',
                        style: DarkTheme().darkTheme.textTheme.bodyText2),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
