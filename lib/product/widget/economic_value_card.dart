import 'package:agenda_app_with_flutter/product/colors/project_colors.dart';
import 'package:agenda_app_with_flutter/product/constants/project_constants.dart';
import 'package:agenda_app_with_flutter/product/constants/project_paddings.dart';
import 'package:flutter/material.dart';

class EconomicValueCard extends StatelessWidget
    with DarkThemeColors, ProjectPaddings, ProjectConstants {
  EconomicValueCard({
    Key? key,
    required this.doviz,
    required this.dovizName,
  }) : super(key: key);
  final String? doviz;
  final String dovizName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: padding10, bottom: padding10, left: padding10),
      child: Container(
        height: MediaQuery.of(context).size.height * widgetSize02,
        width: MediaQuery.of(context).size.width * widgetSize03,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(color: Colors.black, blurRadius: 6, spreadRadius: 0.5)
          ],
          color: deepSpaceSparkle,
          borderRadius: BorderRadius.circular(padding10),
        ),
        child: Padding(
          padding: EdgeInsets.all(padding10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                dovizName,
                style: TextStyle(color: white, fontWeight: FontWeight.w700),
              ),
              Text(
                doviz ?? nullNumbers,
                style: TextStyle(color: white, fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
