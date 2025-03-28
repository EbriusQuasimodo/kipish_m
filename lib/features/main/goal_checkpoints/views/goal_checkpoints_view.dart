import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:get/get.dart';
import 'package:kipish_m/features/main/goal_checkpoints/controllers/goal_checkpoints_controller.dart';
import 'package:kipish_m/services/app_theme.dart';
import 'package:kipish_m/widgets/accent_button.dart';
import 'package:kipish_m/widgets/date_picker_field.dart';
import 'package:kipish_m/widgets/form_text_field.dart';
import 'package:kipish_m/widgets/instruction_block.dart';

class GoalCheckpointsView extends GetView<GoalCheckpointsController> {
  const GoalCheckpointsView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Get.find<AppThemeController>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.main_light,
        titleSpacing: 0,
        title: Text('Контрольные точки', style: theme.heading2),
        leading: GestureDetector(
          onTap: () => Get.back(),
          child:
              Icon(TablerIcons.chevron_left, color: theme.main_dark, size: 35),
        ),
        elevation: 0,
      ),
      backgroundColor: theme.main_light,
      body: SafeArea(
        child: Stack(
          children: [
            // Основное содержимое с прокруткой - отступ внизу для кнопки сохранить
            Padding(
              padding: const EdgeInsets.only(bottom: 80),
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Блок инструкции
                      InstructionBlock(
                        isExpanded: controller.isInstructionExpanded,
                        onToggle: controller.toggleInstruction,
                        instructionText: controller.instructionText,
                      ),

                      SizedBox(height: 24),

                      // Начальная точка
                      FormTextField(
                        label: 'Начальная точка',
                        hint: 'Введите заголовок цели',
                        controller: controller.initialCheckpointController,
                        bottomPadding: 16,
                      ),

                      // Динамический список контрольных точек
                      Obx(() => ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: controller.checkpoints.length,
                            itemBuilder: (context, index) {
                              final checkpoint = controller.checkpoints[index];
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Заголовок и поле для контрольной точки
                                  FormTextField(
                                    label: 'Контрольная точка ${index + 1}',
                                    hint: 'Подробно опишите цель',
                                    controller: checkpoint.titleController,
                                    bottomPadding: 2,
                                  ),

                                  // Кнопка связывания с существующей точкой
                                  TextButton.icon(
                                    onPressed: () => controller
                                        .linkWithExistingCheckpoint(index),
                                    icon: Icon(TablerIcons.plus,
                                        size: 20, color: theme.main_dark),
                                    label: Text(
                                      'Связать с существующей контрольной точкой',
                                      style: theme.hintTextAccent,
                                    ),
                                    style: TextButton.styleFrom(
                                      padding: EdgeInsets.zero,
                                      alignment: Alignment.centerLeft,
                                    ),
                                  ),

                                  // Поле выбора даты для контрольной точки
                                  DatePickerField(
                                    label: 'Добавьте срок выполнения',
                                    controller: checkpoint.dateController,
                                    bottomPadding: 12,
                                  ),
                                ],
                              );
                            },
                          )),

                      // Кнопка добавления новой контрольной точки
                      TextButton.icon(
                        onPressed: controller.addCheckpoint,
                        icon: Icon(TablerIcons.plus,
                            size: 20, color: theme.main_dark),
                        label: Text(
                          'Добавить контрольную точку',
                          style: theme.mainTextAccent
                              .copyWith(color: theme.main_dark),
                        ),
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          alignment: Alignment.centerLeft,
                        ),
                      ),

                      SizedBox(height: 32),
                    ],
                  ),
                ),
              ),
            ),

            // Закрепленная внизу кнопка "Сохранить"
            Positioned(
              left: 16,
              right: 16,
              bottom: 16,
              child: Obx(() => SizedBox(
                    width: context.width,
                    height: 48,
                    child: AccentButton(
                      text: 'Сохранить',
                      onPressed: controller.saveCheckpoints,
                      isEnabled: controller.isFormValid.value,
                      height: 48,
                      backgroundColor: theme.accent_color,
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
