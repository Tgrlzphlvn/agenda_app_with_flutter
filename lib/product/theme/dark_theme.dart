import 'package:agenda_app_with_flutter/product/colors/project_colors.dart';
import 'package:flutter/material.dart';

class DarkTheme {
  final _darkThemeColors = DarkThemeColors();
  late final ThemeData darkTheme;

  DarkTheme() {
    darkTheme = ThemeData(
      scaffoldBackgroundColor: _darkThemeColors.richBlackFogra29,
      appBarTheme: AppBarTheme(
          shadowColor: _darkThemeColors.transparent,
          elevation: 0,
          centerTitle: false,
          color: _darkThemeColors.richBlackFogra29,
          iconTheme: IconThemeData(
            color: _darkThemeColors.white,
          )),
      textTheme: TextTheme(
        headline5: TextStyle(
          color: _darkThemeColors.white,
          fontSize: 32,
          fontFamily: 'helvetica',
          fontWeight: FontWeight.bold,
        ),
        headline4: TextStyle(
          color: _darkThemeColors.white,
          fontSize: 28,
          fontFamily: 'helvetica',
          fontWeight: FontWeight.bold,
        ),
        bodyText1: TextStyle(
          color: _darkThemeColors.white,
          fontSize: 16,
          fontFamily: 'helvetica',
          fontWeight: FontWeight.w400,
          wordSpacing: 3,
          letterSpacing: 1.2,
        ),
        bodyText2: TextStyle(
          color: _darkThemeColors.platinum,
          fontSize: 14,
          fontFamily: 'helvetica',
          fontWeight: FontWeight.w400,
          wordSpacing: 3,
          letterSpacing: 1.2,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: _darkThemeColors.richBlackFogra29,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: _darkThemeColors.white,
        unselectedItemColor: _darkThemeColors.platinum,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          primary: _darkThemeColors.oxfordBlue,
          textStyle: TextStyle(color: _darkThemeColors.white),
        ),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: _darkThemeColors.richBlackFogra29,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: TextStyle(color: _darkThemeColors.white),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      colorScheme: ColorScheme.dark(
          primary: _darkThemeColors.platinum, onPrimary: _darkThemeColors.white),
    );
  }
}
