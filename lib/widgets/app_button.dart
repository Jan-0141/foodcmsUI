import 'package:flutter/material.dart';

/// ปุ่มกลางใช้ซ้ำได้ทั้งแอป
class AppButton extends StatelessWidget {
  /// ข้อความบนปุ่ม
  final String label;

  /// กดแล้วให้ทำอะไร
  final VoidCallback? onPressed;

  /// แสดงวงกลมโหลด (เช่น ระหว่างยิง API)
  final bool isLoading;

  /// ปุ่มเต็มความกว้าง parent ดีฟอลต์ = true
  final bool fullWidth;

  /// บังคับความกว้างเอง (จะ override fullWidth ถ้ากำหนด)
  final double? width;

  /// สูงของปุ่ม (ดีฟอลต์ 48)
  final double height;

  /// ใส่ icon ซ้ายข้อความ
  final IconData? icon;

  /// ปุ่ม style แบบไหน
  final AppButtonVariant variant;

  const AppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
    this.fullWidth = true,
    this.width,
    this.height = 48,
    this.icon,
    this.variant = AppButtonVariant.primary,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    // สีตาม variant
    final Color bgColor;
    final Color fgColor;
    switch (variant) {
      case AppButtonVariant.primary:
        bgColor = colorScheme.primary;
        fgColor = colorScheme.onPrimary;
        break;
      case AppButtonVariant.secondary:
        bgColor = colorScheme.secondaryContainer;
        fgColor = colorScheme.onSecondaryContainer;
        break;
      case AppButtonVariant.tertiary:
        bgColor = colorScheme.surfaceVariant;
        fgColor = colorScheme.onSurfaceVariant;
        break;
    }

    // ตัวจริงของปุ่ม (ไม่สนเรื่องความกว้าง)
    final childButton = ElevatedButton(
      onPressed: (onPressed != null && !isLoading) ? onPressed : null,
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
        foregroundColor: fgColor,
        minimumSize: Size(width ?? 0, height),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        textStyle: theme.textTheme.labelLarge?.copyWith(
          fontWeight: FontWeight.w600,
        ),
      ),
      child: _buildChildContent(),
    );

    // จัดการเรื่องความกว้าง
    Widget wrapped = childButton;

    if (width != null) {
      wrapped = SizedBox(
        width: width,
        child: wrapped,
      );
    } else if (fullWidth) {
      wrapped = SizedBox(
        width: double.infinity,
        child: wrapped,
      );
    }

    return wrapped;
  }

  /// เนื้อในของปุ่ม (โหลด / icon / label)
  Widget _buildChildContent() {
    if (isLoading) {
      return const SizedBox(
        height: 20,
        width: 20,
        child: CircularProgressIndicator(
          strokeWidth: 2,
        ),
      );
    }

    if (icon == null) {
      return Text(label);
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 20),
        const SizedBox(width: 8),
        Text(label),
      ],
    );
  }
}

/// รูปแบบปุ่ม
enum AppButtonVariant {
  primary,
  secondary,
  tertiary,
}
