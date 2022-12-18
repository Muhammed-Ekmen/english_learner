import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();
  static final AppTheme _appTheme = AppTheme._();
  static AppTheme get instance => _appTheme;

  ThemeData? theme=ThemeData();
}
