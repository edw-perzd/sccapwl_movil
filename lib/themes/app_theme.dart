import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const mainColor = Color.fromARGB(255, 19, 121, 204);
  static const backColor = Colors.white;
  static const darkColor = Colors.black;
  static const mediumColor = Color(0xFF003459);
  static const mediumColorTrans = Color.fromARGB(66, 0, 52, 89);
  static const secColor = Color(0XFF007EA7);

  static final ThemeData lightTheme = ThemeData.light().copyWith(
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: AppBarTheme(
          color: mainColor,
          titleTextStyle: GoogleFonts.hindMadurai(
              color: darkColor, fontSize: 28.0, fontWeight: FontWeight.bold)),
      iconTheme: const IconThemeData(
        color: backColor,
        size: 25.0,
      ),
      cardTheme: const CardTheme(
        color: backColor,
        elevation: 10,
      ),
      textTheme: TextTheme(
          titleLarge: GoogleFonts.hindMadurai(
              color: darkColor, fontSize: 35.0, fontWeight: FontWeight.bold),
          titleSmall: GoogleFonts.hindMadurai(
              color: darkColor, fontSize: 25.0, fontWeight: FontWeight.bold),
          headlineLarge: GoogleFonts.hindMadurai(
              color: backColor, fontSize: 35.0, fontWeight: FontWeight.bold),
          headlineMedium: GoogleFonts.hindMadurai(
            color: backColor,
            fontWeight: FontWeight.bold,
            fontSize: 25.0,
          ),
          headlineSmall: GoogleFonts.hindMadurai(
            color: backColor,
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
          bodyLarge: GoogleFonts.hindMadurai(
            color: darkColor,
            fontSize: 18.0,
          ),
          bodyMedium: GoogleFonts.hindMadurai(
              color: darkColor, fontSize: 16.0, fontWeight: FontWeight.bold),
          bodySmall: GoogleFonts.hindMadurai(
            color: darkColor,
            fontSize: 14.0,
          ),
          labelLarge: GoogleFonts.hindMadurai(
              color: mainColor, fontSize: 16.0, fontWeight: FontWeight.bold),
          labelMedium: GoogleFonts.hindMadurai(
              color: Colors.grey, fontSize: 16.0, fontWeight: FontWeight.bold),
          labelSmall: GoogleFonts.hindMadurai(
            color: Colors.grey,
            fontSize: 14.0,
          )));
}
