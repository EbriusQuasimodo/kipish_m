// lib/widgets/accent_button.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kipish_m/services/app_theme.dart';

class AccentButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final double? height;

  const AccentButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Get.find<AppThemeController>();

    return SizedBox(
      height: height ?? 36,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? theme.accent_color,
          foregroundColor: textColor ?? theme.main_light,
          // Форма "терминатор" с максимальным скруглением
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          // Минимальный размер кнопки для уменьшения внутреннего отступа
          minimumSize: Size.zero,
          // Отключаем tapTargetSize для меньшей внутренней высоты
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        child: Text(
          text,
          style: theme.mainTextAccent,
        ),
      ),
    );
  }
}
