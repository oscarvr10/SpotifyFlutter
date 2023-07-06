import 'package:flutter/material.dart';

class AppTheme {
  ThemeData getTheme() => ThemeData(
        useMaterial3: false,
        colorSchemeSeed: Colors.white,
        brightness: Brightness.dark,
        // fontFamily: 'Circular',
      );
}
