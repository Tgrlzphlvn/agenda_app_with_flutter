import 'package:agenda_app_with_flutter/feature/model/daily.dart';
import 'package:agenda_app_with_flutter/product/colors/project_colors.dart';
import 'package:agenda_app_with_flutter/product/constants/project_constants.dart';
import 'package:agenda_app_with_flutter/product/constants/project_paddings.dart';
import 'package:agenda_app_with_flutter/product/theme/dark_theme.dart';
import 'package:flutter/material.dart';

class DailyItem extends StatelessWidget
    with DarkThemeColors, ProjectConstants, ProjectPaddings {
  DailyItem({
    Key? key,
    required this.daily,
  }) : super(key: key);

  final Daily daily;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding10),
      child: GestureDetector(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          padding: EdgeInsets.all(padding10),
          decoration: BoxDecoration(
            color: bdazzledBlue,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(Radius.circular(padding10)),
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(padding5),
                child: _descriptionText(),
              ),
              Row(
                children: [
                  const Spacer(),
                  Padding(
                    padding: EdgeInsets.all(padding5),
                    child: _dailyDate(),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Text _descriptionText() {
    return Text(
      daily.description,
      style: DarkTheme().darkTheme.textTheme.bodyText1,
    );
  }

  Text _dailyDate() {
    String date =
        '${daily.createdTime.hour}:${daily.createdTime.minute} ${daily.createdTime.day}.${daily.createdTime.month}.${daily.createdTime.year}';
    return Text(
      date,
      style: DarkTheme().darkTheme.textTheme.bodyText2,
    );
  }
}
