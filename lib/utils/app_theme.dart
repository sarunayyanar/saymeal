import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const Color primary = Color(0xFF006E28);
  static const Color primaryContainer = Color(0xFF34C759);
  static const Color secondary = Color(0xFF316A38);
  static const Color background = Color(0xFFF9F9FE);
  static const Color surface = Color(0xFFF9F9FE);
  static const Color onSurface = Color(0xFF1A1C1F);
  static const Color onSurfaceVariant = Color(0xFF3D4A3C);
  static const Color outline = Color(0xFF6D7B6B);
  static const Color surfaceContainer = Color(0xFFEDEDF2);
  static const Color surfaceContainerLow = Color(0xFFF3F3F8);
  static const Color surfaceContainerLowest = Color(0xFFFFFFFF);
  static const Color error = Color(0xFFBA1A1A);
  
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primary, primaryContainer],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        primary: AppColors.primary,
        onPrimary: Colors.white,
        background: AppColors.background,
        surface: AppColors.surface,
        onSurface: AppColors.onSurface,
        secondary: AppColors.secondary,
        error: AppColors.error,
      ),
      scaffoldBackgroundColor: AppColors.background,
      textTheme: GoogleFonts.interTextTheme().copyWith(
        displayLarge: GoogleFonts.manrope(
          fontWeight: FontWeight.w800,
          color: AppColors.onSurface,
        ),
        headlineLarge: GoogleFonts.manrope(
          fontWeight: FontWeight.w700,
          color: AppColors.onSurface,
        ),
        titleLarge: GoogleFonts.manrope(
          fontWeight: FontWeight.w600,
          color: AppColors.onSurface,
        ),
        labelLarge: GoogleFonts.inter(
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2,
        ),
      ),
      cardTheme: CardTheme(
        color: AppColors.surfaceContainerLowest,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
