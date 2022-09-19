import 'package:flutter/material.dart';

//light theme
ThemeData light = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.indigo,
    buttonTheme: const ButtonThemeData(
        buttonColor: Colors.indigo, textTheme: ButtonTextTheme.primary),
    scaffoldBackgroundColor: const Color(0xfff1f1f1));

//dark theme
ThemeData dark = ThemeData(
  brightness: Brightness.dark,
  primarySwatch: Colors.indigo,
  buttonTheme: const ButtonThemeData(
    buttonColor: Colors.red,
    textTheme: ButtonTextTheme.primary,
  ),
);
