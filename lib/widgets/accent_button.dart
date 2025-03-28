import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kipish_m/services/app_theme.dart';

class AccentButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final double? height;
  final bool isEnabled;

  const AccentButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.height,
    this.isEnabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Get.find<AppThemeController>();

    // Определяем цвета в зависимости от состояния
    final bgColor = isEnabled
        ? (backgroundColor ?? theme.accent_color)
        : theme.accent_color_light;

    final txtColor =
        isEnabled ? (textColor ?? theme.main_light) : theme.accent_color_dark;

    return SizedBox(
      height: height ?? 36,
      child: ElevatedButton(
        onPressed: isEnabled ? onPressed : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          foregroundColor: txtColor,
          disabledBackgroundColor: theme.accent_color_light,
          disabledForegroundColor: theme.accent_color_dark,
          // Форма с максимальным скруглением
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          // Минимальный размер кнопки для уменьшения внутреннего отступа
          minimumSize: Size.zero,
          // Отключаем tapTargetSize для меньшей внутренней высоты
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        child: Text(
          text,
          style: theme.mainTextAccent.copyWith(color: txtColor),
        ),
      ),
    );
  }
}
