// lib/main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/theme/app_theme.dart';
// ถ้ายังไม่มี LoginPage ก็เปลี่ยนเป็น HomePage ที่มีอยู่จริง ๆ ก่อน
import 'features/auth/state/auth_provider.dart';
import 'features/auth/data/auth_api.dart';
import 'features/auth/presentation/login_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => AuthProvider(AuthApi()),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food CMS',
      debugShowCheckedModeBanner: false,

      // ถ้ายังไม่มี AppTheme.light/dark ให้ comment ออกชั่วคราวก่อน
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.light,

      // ยังไม่ใช้ routes ลองใช้ home อย่างเดียวให้รันผ่านก่อน
      home: const LoginPage(),
    );
  }
}
