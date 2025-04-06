import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// 应用程序颜色常量定义
/// 包含主题色、文本色、背景色等颜色定义
class AppColors {
  // 主要颜色
  static const Color primary = Color(0xFF4318FF);
  static const Color secondary = Color(0xFF707EAE);
  static const Color background = Color(0xFFF4F7FE);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);

  // 文本颜色
  static const Color textPrimary = Color(0xFF2B3674);
  static const Color textSecondary = Color(0xFF1B2559);
  static const Color textLight = Color(0xFFA3AED0);

  // 其他颜色
  static const Color cardBackground = Color(0xFFFFFFFF);
  static const Color buttonBackground = Color(0xFF11047A);
  static const Color searchBackground = Color(0xFFF4F7FE);
  static const Color bannerBackground = Color(0xFF868CFF);
}

/// 应用程序主题配置
/// 定义了应用的整体视觉风格，包括颜色、字体、组件样式等
class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.background,
      colorScheme: const ColorScheme.light(
        primary: AppColors.primary,
        secondary: AppColors.secondary,
        surface: AppColors.background,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: AppColors.textPrimary),
        titleTextStyle: TextStyle(
          fontFamily: 'DM Sans',
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: AppColors.textPrimary,
        ),
      ),
      cardTheme: const CardTheme(
        color: AppColors.cardBackground,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
      ),
      textTheme: TextTheme(
        displayLarge: GoogleFonts.dmSans(
          fontWeight: FontWeight.bold,
          fontSize: 34,
          color: AppColors.textPrimary,
        ),
        displayMedium: GoogleFonts.dmSans(
          fontWeight: FontWeight.bold,
          fontSize: 24,
          color: AppColors.textPrimary,
        ),
        titleLarge: GoogleFonts.dmSans(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: AppColors.textPrimary,
        ),
        titleMedium: GoogleFonts.dmSans(
          fontWeight: FontWeight.bold,
          fontSize: 18,
          color: AppColors.textSecondary,
        ),
        bodyLarge: GoogleFonts.dmSans(
          fontWeight: FontWeight.w500,
          fontSize: 16,
          color: AppColors.textPrimary,
        ),
        bodyMedium: GoogleFonts.dmSans(
          fontWeight: FontWeight.w500,
          fontSize: 14,
          color: AppColors.textSecondary,
        ),
        bodySmall: GoogleFonts.dmSans(
          fontWeight: FontWeight.w400,
          fontSize: 14,
          color: AppColors.textLight,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.buttonBackground,
          foregroundColor: AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(70),
          ),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
          textStyle: GoogleFonts.dmSans(
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.primary,
          side: const BorderSide(color: AppColors.primary),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(70),
          ),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
          textStyle: GoogleFonts.dmSans(
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.searchBackground,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(49),
          borderSide: BorderSide.none,
        ),
        hintStyle: GoogleFonts.dmSans(
          fontWeight: FontWeight.w400,
          fontSize: 14,
          color: AppColors.textLight,
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      ),
    );
  }
}
