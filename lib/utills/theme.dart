import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:msf/utills/colorconfig.dart';

//Todo: Working on WHITE THEME...
//Problems: GetX theme changer not working in the 4.5.1, 4.6.1, 4.6.6 version :/
ThemeData getTheme(bool isDark) {
  return isDark
    ? ThemeData.light().copyWith(
        scaffoldBackgroundColor: bgColorW,
        drawerTheme:DrawerThemeData(
          backgroundColor: bgDrawer
        ),
        canvasColor: Colors.white,
        primaryColor: Colors.white,
        textTheme: GoogleFonts.poppinsTextTheme(ThemeData.light().textTheme.apply(bodyColor: Colors.black)),
      )
      :ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color.fromARGB(255, 31, 30, 45),
        drawerTheme:DrawerThemeData(
          backgroundColor: secondryColor,
        ),
        canvasColor: Color(0xFF2A2D3E),
        primaryColor: Colors.white,
        textTheme: GoogleFonts.poppinsTextTheme(ThemeData.dark().textTheme.apply(bodyColor: Colors.white)),
      );
}