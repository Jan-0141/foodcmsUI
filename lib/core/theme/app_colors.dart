// lib/core/theme/app_colors.dart
import 'package:flutter/material.dart';

class AppColors {
  // สีหลักของแบรนด์ (เช่น เหลือง)
  static const Color primary = Color(0xFFFFC107); // amber-ish

  // สีพื้นหลังหลัก
  static const Color lightBackground = Color.fromARGB(255, 244, 245, 207);
  static const Color darkBackground = Color(0xFF121212);

  static const Color cardColorlight = Color.fromARGB(255, 249, 240, 172);
  static const Color cardColordark = Color.fromARGB(255, 160, 152, 86);

  // สีตัวหนังสือหลัก
  static const Color lightText = Color(0xFF1A1A1A);
  static const Color darkText = Color(0xFFF5F5F5);

  // accent / warning / success
  static const Color success = Color(0xFF4CAF50);
  static const Color warning = Color(0xFFFF9800);
  static const Color error = Color(0xFFF44336);
}
