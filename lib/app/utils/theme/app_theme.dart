import 'package:flutter/material.dart';
import 'package:wheather_forecast_app/app/constant/colors.dart';

class AppTheme {
  AppTheme._();

  static String appName = "Weather Forecast App";
  static ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    brightness: Brightness.light,
    scaffoldBackgroundColor: backgroundColor,
    primaryColorLight: primaryColor,
    primaryColorDark: primaryColor,
    useMaterial3: true,
    fontFamily: "MonaSans",
    textTheme: TextTheme(
      headlineLarge: TextStyle(
          fontSize: 24.0, fontWeight: FontWeight.bold, color: secondaryColor),
      headlineMedium: TextStyle(
          fontSize: 18.0, fontWeight: FontWeight.w500, color: secondaryColor),
      headlineSmall: TextStyle(fontSize: 18.0, color: secondaryColor),
      bodyLarge: TextStyle(
          fontSize: 16.0, fontWeight: FontWeight.w600, color: secondaryColor),
      bodyMedium: TextStyle(
          fontSize: 14.0, fontWeight: FontWeight.w500, color: secondaryColor),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        disabledBackgroundColor: primaryColor.withOpacity(0.2),
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        textStyle: const TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w600,
        ),
        minimumSize: const Size(40, 40),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    ),
  );
}
