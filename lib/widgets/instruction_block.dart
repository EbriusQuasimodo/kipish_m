import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:get/get.dart';
import 'package:kipish_m/services/app_theme.dart';

class InstructionBlock extends StatelessWidget {
  final RxBool isExpanded;
  final VoidCallback onToggle;
  final String instructionText;

  const InstructionBlock({
    Key? key,
    required this.isExpanded,
    required this.onToggle,
    required this.instructionText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Get.find<AppThemeController>();

    return GestureDetector(
      onTap: onToggle,
      child: Container(
        padding: const EdgeInsets.all(13),
        decoration: BoxDecoration(
          color: Color(theme.themes[0].accent_color_dark2),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                // PNG иконка из ассетов
                Image.asset(
                  'assets/images/kipish_icon.png',
                  width: 18,
                  height: 18,
                  color: theme.accent_color,
                ),
                const SizedBox(width: 8),
                Text(
                  'Инструкция',
                  style: theme.hintTextAccent,
                ),
                const Spacer(),
                // Визуальная кнопка сворачивания/разворачивания
                Row(
                  children: [
                    Obx(() => Text(
                          isExpanded.value ? 'Свернуть' : 'Развернуть',
                          style: theme.hintTextAccent,
                        )),
                    const SizedBox(width: 4),
                    Obx(() => Icon(
                          isExpanded.value
                              ? TablerIcons.chevron_up
                              : TablerIcons.chevron_down,
                          color: theme.main_dark,
                        )),
                  ],
                ),
              ],
            ),
            // Показываем текст инструкции только если она развернута
            Obx(() {
              if (isExpanded.value) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8),
                    Text(
                      instructionText,
                      style: theme.hintTextRegular,
                    ),
                  ],
                );
              } else {
                return const SizedBox.shrink();
              }
            }),
          ],
        ),
      ),
    );
  }
}
