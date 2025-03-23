import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:get/get.dart';
import 'package:kipish_m/features/main/create_goal/controllers/create_goal_controller.dart';
import 'package:kipish_m/services/app_theme.dart';
import 'package:kipish_m/widgets/accent_button.dart';

class CreateGoalView extends GetView<CreateGoalController> {
  const CreateGoalView({super.key});

  @override
  Widget build(BuildContext context) {
    // Получаем доступ к теме
    final theme = Get.find<AppThemeController>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.main_light,
        title: Text('Новая цель', style: theme.heading2),
        leading: GestureDetector(
          onTap: () => Get.back(),
          child:
              Icon(TablerIcons.chevron_left, color: theme.main_dark, size: 28),
        ),
        elevation: 0,
      ),
      backgroundColor: theme.main_light,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Блок инструкции, весь кликабельный
            GestureDetector(
              onTap: controller.toggleInstruction,
              child: Obx(() => _buildInstructionBlock(theme)),
            ),

            const SizedBox(height: 20),

            // Кнопки создания цели
            Center(
              child: Column(
                children: [
                  // Кнопка создания цели по методике SMART LEAF
                  SizedBox(
                    width: context.width,
                    child: AccentButton(
                      text: 'Задать цель по методике SMART LEAF',
                      onPressed: () {}, // Пустая функция вместо null
                      height: 36,
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Кнопка самостоятельного задания цели
                  Text(
                    'Внести самостоятельно',
                    style: theme.mainTextAccent.copyWith(
                      color: theme.accent_color_dark,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Метод для построения блока инструкции
  Widget _buildInstructionBlock(AppThemeController theme) {
    return Container(
      padding: const EdgeInsets.all(16),
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
                  Text(
                    controller.isInstructionExpanded.value
                        ? 'Свернуть'
                        : 'Развернуть',
                    style: theme.hintTextAccent,
                  ),
                  const SizedBox(width: 4),
                  Icon(
                    controller.isInstructionExpanded.value
                        ? TablerIcons.chevron_up
                        : TablerIcons.chevron_down,
                    color: theme.main_dark,
                  ),
                ],
              ),
            ],
          ),

          // Показываем текст инструкции только если она развернута
          if (controller.isInstructionExpanded.value) ...[
            const SizedBox(height: 8),
            Text(
              'Цели добавляются в статистику дорожной карты. '
              'Обозначьте цель на этот год, опишите контрольные точки её достижения и '
              'отслеживайте прогресс выполнения на общей карте. Помните, что цель должна быть '
              'реалистичная, конкретная, измеримая и имела дедлайн, также помните о легальности, '
              'экологичности и амбициозности',
              style: theme.hintTextRegular,
            ),
          ],
        ],
      ),
    );
  }
}
