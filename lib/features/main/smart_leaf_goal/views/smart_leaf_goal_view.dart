import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:get/get.dart';
import 'package:kipish_m/features/main/smart_leaf_goal/controllers/smart_leaf_goal_controller.dart';
import 'package:kipish_m/services/app_theme.dart';
import 'package:kipish_m/widgets/accent_button.dart';
import 'package:kipish_m/widgets/date_picker_field.dart';
import 'package:kipish_m/widgets/form_text_field.dart';
import 'package:kipish_m/widgets/instruction_block.dart';
import 'package:kipish_m/widgets/select_field.dart';

class SmartLeafGoalView extends GetView<SmartLeafGoalController> {
  const SmartLeafGoalView({super.key});

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
      body: SingleChildScrollView(
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

              // Основные поля формы
              FormTextField(
                label: 'Краткое название цели',
                hint: 'Введите заголовок цели',
                controller: controller.titleController.value,
              ),

              FormTextField(
                label: 'Цель: Конкретная (Specific)',
                hint: 'Опишите четко, что именно вы хотите достичь',
                controller: controller.specificController.value,
                multiline: true,
              ),

              FormTextField(
                label: 'Цель: Измеримая (Measurable)',
                hint: 'Как вы будете измерять прогресс и успех?',
                controller: controller.measurableController.value,
                multiline: true,
              ),

              FormTextField(
                label: 'Цель: Достижимая (Achievable)',
                hint: 'Почему эта цель реалистична для вас?',
                controller: controller.achievableController.value,
                multiline: true,
              ),

              FormTextField(
                label: 'Цель: Релевантная (Relevant)',
                hint: 'Почему эта цель важна для вас сейчас?',
                controller: controller.relevantController.value,
                multiline: true,
              ),

              FormTextField(
                label: 'Цель: Ограничена по времени (Time-bound)',
                hint: 'Укажите временные рамки для достижения цели',
                controller: controller.timeController.value,
                multiline: true,
              ),

              FormTextField(
                label: 'Цель: Легальная (Legal)',
                hint: 'Подтвердите, что цель соответствует законам',
                controller: controller.legalController.value,
                multiline: true,
              ),

              FormTextField(
                label: 'Цель: Этичная (Ethical)',
                hint: 'Опишите, как цель соответствует этическим нормам',
                controller: controller.ethicalController.value,
                multiline: true,
              ),

              FormTextField(
                label: 'Цель: Согласованная (Agreed)',
                hint: 'С кем согласована эта цель?',
                controller: controller.agreedController.value,
                multiline: true,
              ),

              FormTextField(
                label: 'Цель: Гибкая (Flexible)',
                hint: 'Как вы можете адаптировать цель при необходимости?',
                controller: controller.flexibleController.value,
                multiline: true,
              ),

              // Выбор даты достижения цели
              DatePickerField(
                label: 'Добавьте дату достижения цели',
                controller: controller.deadlineController.value,
              ),

              // Выбор сферы жизни
              SelectField(
                label: 'Соотнесите цель со сферой жизни',
                hintText: 'Выберите сферу жизни',
                controller: controller.lifeSphereController.value,
                options: controller.lifeSpheres,
              ),

              // Кнопка для перехода к контрольным точкам
              Center(
                child: Obx(() => SizedBox(
                      width: context.width,
                      height: 48,
                      child: AccentButton(
                        text: 'Далее к контрольным точкам',
                        onPressed: controller.goToCheckpoints,
                        isEnabled: controller.isFormValid.value,
                        height: 48,
                        backgroundColor: theme.accent_color,
                      ),
                    )),
              ),
              SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
