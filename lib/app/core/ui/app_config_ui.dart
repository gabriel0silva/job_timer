import 'package:flutter/material.dart';

class AppConfigUi {
  AppConfigUi._();

  static const MaterialColor primarySwatch = MaterialColor(0XFF835AFD, {
    50: Color(0XFF7651e4),
    100: Color(0XFF6948ca),
    200: Color(0XFF5c3fb1),
    300: Color(0XFF4f3698),
    400: Color(0XFF422d7f),
    500: Color(0XFF342465),
    600: Color(0XFF271b4c),
    700: Color(0XFF1a1233),
    800: Color(0XFF0d0919),
    900: Color(0XFF000000),
  });

  static final ThemeData theme = ThemeData(
      primarySwatch: primarySwatch,
      primaryColor: const Color(0XFF835AFD),
      primaryColorLight: const Color(0XFF612CFF),
      inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          labelStyle: TextStyle(color: Colors.black)),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
      ));
}
