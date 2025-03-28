import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:get/get.dart';
import 'package:kipish_m/features/main/create_goal/controllers/create_goal_controller.dart';
import 'package:kipish_m/routes/app_pages.dart';
import 'package:kipish_m/services/app_theme.dart';
import 'package:kipish_m/widgets/accent_button.dart';
import 'package:kipish_m/widgets/instruction_block.dart';

class CreateGoalView extends GetView<CreateGoalController> {
  const CreateGoalView({super.key});

  @override
  Widget build(BuildContext context) {
    // Получаем доступ к теме
    final theme = Get.find<AppThemeController>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.main_light,
        titleSpacing: 0,
        title: Text('Новая цель', style: theme.heading2),
        leading: GestureDetector(
          onTap: () => Get.back(),
          child:
              Icon(TablerIcons.chevron_left, color: theme.main_dark, size: 35),
        ),
        elevation: 0,
      ),
      backgroundColor: theme.main_light,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Блок инструкции
            InstructionBlock(
              isExpanded: controller.isInstructionExpanded,
              onToggle: controller.toggleInstruction,
              instructionText: 'Цели добавляются в статистику дорожной карты. '
                  'Обозначьте цель на этот год, опишите контрольные точки её достижения и '
                  'отслеживайте прогресс выполнения на общей карте. Помните, что цель должна быть '
                  'реалистичная, конкретная, измеримая и имела дедлайн, также помните о легальности, '
                  'экологичности и амбициозности',
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
                      onPressed: () => Get.toNamed(Routes.SMART_LEAF_GOAL),
                      height: 36,
                      backgroundColor: theme.accent_color,
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
}
