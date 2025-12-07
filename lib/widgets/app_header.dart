import 'package:flutter/material.dart';

/// Header กลางของแอป (ไว้ใช้เป็น AppBar ได้เลย)
class AppHeader extends StatelessWidget implements PreferredSizeWidget {
  /// ข้อความหลัก (ชื่อหน้า)
  final String title;

  /// ข้อความรองด้านล่าง title (เช่น คำอธิบายสั้น ๆ)
  final String? subtitle;

  /// ให้ title อยู่ตรงกลางไหม (เหมาะกับ mobile)
  final bool centerTitle;

  /// แสดงปุ่ม back มุมซ้ายไหม
  final bool showBackButton;

  /// action ปุ่มมุมขวา (เช่น icon ตั้งค่า, search)
  final List<Widget>? actions;

  /// ใช้ backgroundColor พิเศษ (ถ้าไม่กำหนดจะใช้ theme)
  final Color? backgroundColor;

  /// ให้มีเงาไหม (elevation)
  final double elevation;

  const AppHeader({
    super.key,
    required this.title,
    this.subtitle,
    this.centerTitle = true,
    this.showBackButton = false,
    this.actions,
    this.backgroundColor,
    this.elevation = 0,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return AppBar(
      backgroundColor: backgroundColor ?? colorScheme.primary,
      elevation: elevation,
      centerTitle: centerTitle,
      // ปุ่ม back
      leading: showBackButton
          ? IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.maybePop(context);
              },
            )
          : null,
      // เนื้อใน title + subtitle
      title: Column(
        crossAxisAlignment:
            centerTitle ? CrossAxisAlignment.center : CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: theme.textTheme.titleMedium?.copyWith(
              color: colorScheme.onPrimary,
              fontWeight: FontWeight.w600,
            ),
          ),
          if (subtitle != null) ...[
            const SizedBox(height: 2),
            Text(
              subtitle!,
              style: theme.textTheme.bodySmall?.copyWith(
                color: colorScheme.onPrimary.withOpacity(0.85),
              ),
            ),
          ],
        ],
      ),
      actions: actions,
    );
  }

  /// บอก Flutter ว่า header สูงเท่าไหร่ (ใช้กับ appBar:)
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
