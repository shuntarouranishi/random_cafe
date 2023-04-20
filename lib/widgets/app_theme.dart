import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData(
  primarySwatch: Colors.brown,
  accentColor: Colors.orangeAccent,
  textTheme: TextTheme(
    bodyText1: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
  ),
  appBarTheme: AppBarTheme(
    centerTitle: true,
    textTheme: TextTheme(
      headline6: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      primary: Colors.brown,
      textStyle: TextStyle(fontSize: 16),
      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
    ),
  ),
);
