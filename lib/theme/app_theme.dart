import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

<<<<<<< HEAD
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
=======
/// Brend ranglari — ikkala (kunduzgi/kechki) rejimda ham bir xil qoladi.
class AppColors {
  static const Color primary = Color(0xFFFF6B35);
  static const Color primaryDark = Color(0xFFE85A2A);
  static const Color green = Color(0xFF3FAE5C);
  static const Color yellow = Color(0xFFF6C445);
  static const Color star = Color(0xFFF6B93B);
}

/// Rejimga qarab o'zgaruvchi ranglar (fon, karta, matn, chiziq).
/// `context.colors` orqali istalgan widgetdan olinadi.
class AppColorSet {
  final Color background;
  final Color card;
  final Color textDark;
  final Color textGrey;
  final Color divider;
  final Color headerOverlay;

  const AppColorSet({
    required this.background,
    required this.card,
    required this.textDark,
    required this.textGrey,
    required this.divider,
    required this.headerOverlay,
  });

  static const light = AppColorSet(
    background: Color(0xFFFDF1EC),
    card: Color(0xFFFFFFFF),
    textDark: Color(0xFF241A15),
    textGrey: Color(0xFF8A7A72),
    divider: Color(0xFFF0E2DA),
    headerOverlay: Colors.white24,
  );

  static const dark = AppColorSet(
    background: Color(0xFF17120F),
    card: Color(0xFF241E1A),
    textDark: Color(0xFFF5EDE8),
    textGrey: Color(0xFFB2A199),
    divider: Color(0xFF3A312B),
    headerOverlay: Colors.black26,
  );

  static AppColorSet of(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return brightness == Brightness.dark ? dark : light;
  }
}

/// `context.colors.background` kabi qisqa yozuv uchun extension.
extension AppColorsX on BuildContext {
  AppColorSet get colors => AppColorSet.of(this);
}

class AppTheme {
  static ThemeData get light => _build(Brightness.light);
  static ThemeData get dark => _build(Brightness.dark);

  static ThemeData _build(Brightness brightness) {
    final isDark = brightness == Brightness.dark;
    final palette = isDark ? AppColorSet.dark : AppColorSet.light;
    final base = isDark ? ThemeData.dark() : ThemeData.light();

    return base.copyWith(
      brightness: brightness,
      scaffoldBackgroundColor: palette.background,
      primaryColor: AppColors.primary,
      cardColor: palette.card,
      dividerColor: palette.divider,
      colorScheme: base.colorScheme.copyWith(
        primary: AppColors.primary,
        secondary: AppColors.green,
        brightness: brightness,
        surface: palette.card,
      ),
      textTheme: GoogleFonts.manropeTextTheme(base.textTheme).apply(
        bodyColor: palette.textDark,
        displayColor: palette.textDark,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: palette.textDark,
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
        centerTitle: false,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          minimumSize: const Size.fromHeight(54),
<<<<<<< HEAD
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          textStyle: GoogleFonts.manrope(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
=======
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          textStyle: GoogleFonts.manrope(fontSize: 16, fontWeight: FontWeight.w700),
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
          elevation: 0,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
<<<<<<< HEAD
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
=======
        fillColor: palette.card,
        contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
        hintStyle: GoogleFonts.manrope(color: palette.textGrey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: palette.divider),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: palette.divider),
>>>>>>> 8db337a720862265be045519a8602f09ca0ec830
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
