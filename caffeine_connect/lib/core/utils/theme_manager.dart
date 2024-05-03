import 'package:caffeine_connect/core/utils/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class ThemeManager {
  static final ThemeData lightTheme = ThemeData.light().copyWith(
    // Scaffold
    scaffoldBackgroundColor: ColorManager.primary,
    // Appbar
    appBarTheme: const AppBarTheme(
      backgroundColor: ColorManager.primary,
      elevation: 0.0,
      shadowColor: ColorManager.primary,
      scrolledUnderElevation: 0.0,
    ),

    primaryColorLight: ColorManager.primary,

    // Text theme
    textTheme: GoogleFonts.poppinsTextTheme(ThemeData.light().textTheme),
    // Color scheme
    primaryColor: ColorManager.secondary,
  );
}
