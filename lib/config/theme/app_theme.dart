import 'package:flutter/material.dart';

class AppTheme {
  ThemeData getTheme() {
    const seedColor = Colors.green;
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: seedColor,
      appBarTheme: const AppBarTheme(
        centerTitle: true
      )
    );
  }
}
