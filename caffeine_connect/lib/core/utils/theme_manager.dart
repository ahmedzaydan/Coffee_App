import 'package:caffeine_connect/core/utils/color_manager.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
abstract class ThemeManager {
  static final ThemeData lightTheme = ThemeData.light().copyWith(
    useMaterial3: true,
    // Scaffold
    scaffoldBackgroundColor: ColorManager.primary,
    // Text theme
    textTheme: GoogleFonts.poppinsTextTheme(ThemeData.light().textTheme),
  );
}
