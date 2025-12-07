import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String? hint;

  final String? semanticLabel;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged;

  final bool obscureText;
  final bool showObscureToggle;

  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final VoidCallback? onSuffixTap;

  final bool readOnly;
  final VoidCallback? onTap;

  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final FocusNode? focusNode;

  final int maxLines;
  final int minLines;
  final bool enabled;

  /// 👇 ความกว้างสูงสุดของช่อง ถ้า null = กว้างเท่าที่ parent ให้ (เต็ม)
  final double? width;

  /// จัดตำแหน่งในแนวนอน (ซ้าย/กลาง/ขวา)
  final AlignmentGeometry alignment;

  const AppTextField({
    super.key,
    required this.controller,
    required this.label,
    this.hint,
    this.semanticLabel,
    this.validator,
    this.onChanged,
    this.obscureText = false,
    this.showObscureToggle = false,
    this.prefixIcon,
    this.suffixIcon,
    this.onSuffixTap,
    this.readOnly = false,
    this.onTap,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
    this.focusNode,
    this.maxLines = 1,
    this.minLines = 1,
    this.enabled = true,
    this.width,                      // 👈 เพิ่ม
    this.alignment = Alignment.center, // 👈 default ให้อยู่กลาง
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bool useToggle = showObscureToggle;

    return Align(
      alignment: alignment,
      child: SizedBox(
        width: width, // ถ้า null จะขยายเต็ม parent
        child: Semantics(
          label: semanticLabel,
          child: TextFormField(
            controller: controller,
            focusNode: focusNode,
            keyboardType: keyboardType,
            textInputAction: textInputAction,
            readOnly: readOnly,
            onTap: onTap,
            onChanged: onChanged,
            validator: validator,
            enabled: enabled,
            obscureText: obscureText,
            maxLines: obscureText ? 1 : maxLines,
            minLines: minLines,
            style: theme.textTheme.bodyMedium,
            decoration: InputDecoration(
              labelText: label,
              hintText: hint,
              prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
              suffixIcon: useToggle
                  ? _PasswordToggleIcon(
                      isObscured: obscureText,
                      onTap: onSuffixTap,
                    )
                  : (suffixIcon != null
                      ? GestureDetector(
                          onTap: onSuffixTap,
                          child: Icon(suffixIcon),
                        )
                      : null),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: theme.colorScheme.outlineVariant,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: theme.colorScheme.primary,
                  width: 1.6,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: theme.colorScheme.error,
                ),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _PasswordToggleIcon extends StatelessWidget {
  final bool isObscured;
  final VoidCallback? onTap;

  const _PasswordToggleIcon({
    required this.isObscured,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      icon: Icon(
        isObscured ? Icons.visibility_off : Icons.visibility,
      ),
    );
  }
}
