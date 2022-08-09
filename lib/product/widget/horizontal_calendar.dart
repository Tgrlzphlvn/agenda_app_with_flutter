import 'package:agenda_app_with_flutter/product/colors/project_colors.dart';
import 'package:agenda_app_with_flutter/product/constants/project_constants.dart';
import 'package:agenda_app_with_flutter/product/constants/project_paddings.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';

class HorizontalCalendar extends StatelessWidget
    with ProjectPaddings, ProjectConstants, DarkThemeColors {
  HorizontalCalendar(
      {Key? key, required this.selectedDate, required this.onDateSelected})
      : super(key: key);

  final DateTime selectedDate;
  final void Function(DateTime) onDateSelected;

  @override
  Widget build(BuildContext context) {
    return CalendarTimeline(
      initialDate: selectedDate,
      firstDate: _DateTimeEnum.firstDate.date,
      lastDate: _DateTimeEnum.lastDate.date,
      onDateSelected: onDateSelected,
      leftMargin: padding20,
      monthColor: white,
      dayColor: white,
      activeDayColor: white,
      activeBackgroundDayColor: bdazzledBlue,
      dotsColor: white,
      locale: localeTr,
    );
  }
}

enum _DateTimeEnum {
  firstDate,
  lastDate,
}

extension _DateTimeEnumExtension on _DateTimeEnum {
  DateTime get date {
    switch (this) {
      case _DateTimeEnum.firstDate:
        return DateTime(2021, 9, 1);
      case _DateTimeEnum.lastDate:
        return DateTime.now().add(const Duration(days: 365 * 5));
    }
  }
}
