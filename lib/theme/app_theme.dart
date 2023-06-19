import 'package:flutter/material.dart';
import 'palette.dart';

class AppTheme {
  static ThemeData theme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Palette.quinaryColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: Palette.primaryColor,
      elevation: 2,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Palette.secondaryColor,
    ),
  );
}
