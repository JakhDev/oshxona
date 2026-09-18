import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Oshxona ilovasining markaziy rang va uslub palitrasi.
/// Skrinshotlarga mos: to'q sitrus-orange asosiy rang, iliq krem fon,
/// diabet bo'limi uchun yashil urg'u.
class AppColors {
  static const Color primary = Color(0xFFFF6B35); // asosiy orange
  static const Color primaryDark = Color(0xFFE85A2A);
  static const Color background = Color(0xFFFDF1EC); // iliq krem fon
  static const Color card = Color(0xFFFFFFFF);
  static const Color textDark = Color(0xFF241A15);
  static const Color textGrey = Color(0xFF8A7A72);
  static const Color green = Color(0xFF3FAE5C); // diabet urg'usi
  static const Color yellow = Color(0xFFF6C445); // turk taomlari urg'usi
  static const Color star = Color(0xFFF6B93B);
  static const Color divider = Color(0xFFF0E2DA);
}

class AppTheme {
  static ThemeData get light {
    final base = ThemeData.light();
    return base.copyWith(
      scaffoldBackgroundColor: AppColors.background,
      primaryColor: AppColors.primary,
      colorScheme: base.colorScheme.copyWith(
        primary: AppColors.primary,
        secondary: AppColors.green,
      ),
      textTheme: GoogleFonts.manropeTextTheme(base.textTheme).apply(
        bodyColor: AppColors.textDark,
        displayColor: AppColors.textDark,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: AppColors.textDark,
        centerTitle: false,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          minimumSize: const Size.fromHeight(54),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          textStyle: GoogleFonts.manrope(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
          elevation: 0,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
        hintStyle: GoogleFonts.manrope(color: AppColors.textGrey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: AppColors.divider),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: AppColors.divider),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: AppColors.primary, width: 1.6),
        ),
      ),
      useMaterial3: true,
    );
  }
}
