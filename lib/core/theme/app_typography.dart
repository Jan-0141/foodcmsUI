// lib/core/theme/app_typography.dart
import 'package:flutter/material.dart';

class AppFonts {
  // ชื่อฟอนต์ต้องตรงกับที่ตั้งใน pubspec.yaml
  static const String primaryFontFamily = 'Kanit';
}

class AppTypography {
  /// textTheme สำหรับ light mode
  static TextTheme lightTextTheme = TextTheme(
    titleLarge: TextStyle(
      fontFamily: AppFonts.primaryFontFamily,
      fontSize: 22,
      fontWeight: FontWeight.w600,
      color: const Color(0xFF1A1A1A),
    ),
    bodyLarge: TextStyle(
      fontFamily: AppFonts.primaryFontFamily,
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: const Color(0xFF333333),
    ),
    bodyMedium: TextStyle(
      fontFamily: AppFonts.primaryFontFamily,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: const Color(0xFF555555),
    ),
    labelLarge: TextStyle(
      fontFamily: AppFonts.primaryFontFamily,
      fontSize: 14,
      fontWeight: FontWeight.w600,
    ),
  );

  /// textTheme สำหรับ dark mode
  static TextTheme darkTextTheme = TextTheme(
    titleLarge: TextStyle(
      fontFamily: AppFonts.primaryFontFamily,
      fontSize: 22,
      fontWeight: FontWeight.w600,
      color: const Color(0xFFF5F5F5),
    ),
    bodyLarge: TextStyle(
      fontFamily: AppFonts.primaryFontFamily,
      fontSize: 20,
      fontWeight: FontWeight.w400,
      color: const Color(0xFFE0E0E0),
    ),
    bodyMedium: TextStyle(
      fontFamily: AppFonts.primaryFontFamily,
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: const Color(0xFFBDBDBD),
    ),
    labelLarge: TextStyle(
      fontFamily: AppFonts.primaryFontFamily,
      fontSize: 16,
      fontWeight: FontWeight.w600,
    ),
  );
}
