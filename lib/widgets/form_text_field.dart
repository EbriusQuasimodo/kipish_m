import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kipish_m/services/app_theme.dart';

class FormTextField extends StatelessWidget {
  final String label; // Название поля
  final String hint; // Подсказка внутри поля
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool multiline;
  final String? Function(String?)? validator;
  final int? maxLength;
  final double bottomPadding;

  const FormTextField({
    Key? key,
    required this.label,
    required this.hint,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.multiline = false,
    this.validator,
    this.maxLength,
    this.bottomPadding = 0, // По умолчанию нет отступа
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Get.find<AppThemeController>();

    return Padding(
      padding: EdgeInsets.only(bottom: bottomPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Название поля
          Text(
            label,
            style: theme.mainTextAccent.copyWith(color: theme.main_dark),
          ),
          // Увеличенный отступ между названием и полем
          const SizedBox(height: 2),
          // Текстовое поле
          TextField(
            controller: controller,
            keyboardType: keyboardType,
            maxLines: multiline ? 3 : 1,
            minLines: 1, // Всегда минимум 1 строка
            maxLength: maxLength,
            style: theme.mainTextRegular.copyWith(color: theme.main_dark),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: theme.mainTextRegular
                  .copyWith(color: theme.accent_color_dark),
              counterText: '', // Скрыть счетчик символов
              contentPadding: const EdgeInsets.symmetric(
                  vertical: 12), // Уменьшаем вертикальные отступы
              isDense: true, // Компактное отображение
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: theme.main_dark),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: theme.main_dark),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: theme.main_dark, width: 1.5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
