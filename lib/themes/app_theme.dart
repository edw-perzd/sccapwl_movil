import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const mainColor = Color(0xFF00A8E8);
  static const backColor = Colors.white;
  static const darkColor = Color.fromARGB(255, 0, 23, 31);
  static const mediumColor = Color(0xFF003459);

  static final ThemeData lightTheme = ThemeData.light().copyWith(
      scaffoldBackgroundColor: mainColor,
      appBarTheme: AppBarTheme(
          color: mainColor,
          titleTextStyle: GoogleFonts.hindMadurai(
              color: darkColor, fontSize: 28.0, fontWeight: FontWeight.bold)),
      iconTheme: const IconThemeData(
        color: darkColor,
        size: 25.0,
      ),
      cardTheme: const CardTheme(
        color: backColor,
        elevation: 15,
      ),
      textTheme: TextTheme(
          headlineLarge: GoogleFonts.hindMadurai(
              color: darkColor, fontSize: 23.0, fontWeight: FontWeight.bold),
          headlineMedium: GoogleFonts.hindMadurai(
            color: darkColor,
            fontSize: 20.0,
          ),
          bodyMedium: GoogleFonts.hindMadurai(
              color: darkColor, fontSize: 17.0, fontWeight: FontWeight.bold),
          bodySmall: GoogleFonts.hindMadurai(
            color: darkColor,
            fontSize: 17.0,
          )));
}
