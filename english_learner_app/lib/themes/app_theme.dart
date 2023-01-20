import 'package:flutter/material.dart';

abstract class AppTheme {
  ThemeData? customTheme = ThemeData(
    fontFamily: "Oswald",
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent, elevation: 0),
  );
}
