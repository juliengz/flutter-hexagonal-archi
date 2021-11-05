import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  // Default brightness and colors.
  brightness: Brightness.light,
  primaryColor: Colors.teal,

  // Font family.
  fontFamily: 'Helvetica',
  // Text styling for headlines, titles, bodies of text, and more.
  textTheme: const TextTheme(
    headline1: TextStyle(
      fontSize: 80.0,
      fontWeight: FontWeight.bold,
      color: Colors.teal,
    ),
    bodyText1: TextStyle(fontSize: 14.0),
  ),
  buttonTheme: ButtonThemeData(
    height: 40.0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20.0),
    ),
    textTheme: ButtonTextTheme.primary,
    colorScheme: const ColorScheme.light(),
  ),
);
