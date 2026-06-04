import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.terracotta,
        primary: AppColors.terracotta,
        secondary: AppColors.gold,
        surface: AppColors.cream,
        background: AppColors.cream,
        onBackground: AppColors.textBody,
        onSurface: AppColors.textBody,
      ),
      scaffoldBackgroundColor: AppColors.cream,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.dark.withOpacity(0.92),
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        iconTheme: const IconThemeData(color: AppColors.cream),
        titleTextStyle: GoogleFonts.playfairDisplay(
          color: AppColors.cream,
          fontSize: 20,
          fontWeight: FontWeight.w900,
        ),
      ),
      textTheme: TextTheme(
        displayLarge: GoogleFonts.playfairDisplay(
          fontSize: 48,
          height: 1.0,
          fontWeight: FontWeight.w900,
          color: AppColors.cream,
        ),
        headlineMedium: GoogleFonts.playfairDisplay(
          fontSize: 32,
          height: 1.15,
          fontWeight: FontWeight.w900,
          color: AppColors.cream,
        ),
        titleMedium: GoogleFonts.playfairDisplay(
          fontSize: 20,
          height: 1.2,
          fontWeight: FontWeight.w700,
          color: AppColors.dark,
        ),
        bodyLarge: GoogleFonts.crimsonPro(
          fontSize: 18,
          height: 1.6,
          fontWeight: FontWeight.w300,
          color: AppColors.cream.withOpacity(0.8),
        ),
        bodyMedium: GoogleFonts.crimsonPro(
          fontSize: 16,
          height: 1.6,
          fontWeight: FontWeight.w400,
          color: AppColors.textBody,
        ),
        labelSmall: GoogleFonts.spaceMono(
          fontSize: 12,
          letterSpacing: 1.5,
          fontWeight: FontWeight.w400,
          color: AppColors.gold,
        ),
      ),
    );
  }
}
