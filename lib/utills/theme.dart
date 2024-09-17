// theme.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//Todo: Working on WHITE THEME...
ThemeData getTheme(bool isDark) {
  return isDark
    ? ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.white,
        canvasColor: Colors.white,
        textTheme: GoogleFonts.poppinsTextTheme(ThemeData.light().textTheme.apply(bodyColor: Colors.black)),
      )
      :ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color.fromARGB(255, 31, 30, 45),
        canvasColor: Color(0xFF2A2D3E),
        textTheme: GoogleFonts.poppinsTextTheme(ThemeData.dark().textTheme.apply(bodyColor: Colors.white)),
      );
}
