import 'package:flutter/material.dart';

class AppTheme {
  static const mainColor = Color(0xFF00A8E8);
  static const backColor = Colors.white;
  static const darkColor = Color.fromARGB(255, 0, 23, 31);

  static final ThemeData lightTheme = ThemeData.light().copyWith(
      scaffoldBackgroundColor: backColor,
      appBarTheme: const AppBarTheme(
        color: mainColor,
      ),
      iconTheme: const IconThemeData(color: darkColor, size: 25.0));
}
