import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kipish_m/routes/app_pages.dart';
import 'package:kipish_m/utils/base_controller.dart';

class SmartLeafGoalController extends BaseController {
  // Состояние для отслеживания, развернута ли инструкция
  var isInstructionExpanded = false.obs;

  // Состояние для отслеживания валидности формы
  var isFormValid = false.obs;

  // Контроллеры для текстовых полей
  var titleController = TextEditingController().obs;
  var specificController = TextEditingController().obs;
  var measurableController = TextEditingController().obs;
  var achievableController = TextEditingController().obs;
  var relevantController = TextEditingController().obs;
  var timeController = TextEditingController().obs;
  var legalController = TextEditingController().obs;
  var ethicalController = TextEditingController().obs;
  var agreedController = TextEditingController().obs;
  var flexibleController = TextEditingController().obs;
  var deadlineController = TextEditingController().obs;
  var lifeSphereController = TextEditingController().obs;

  // Форм-ключ для валидации
  final formKey = GlobalKey<FormState>();

  // Инструкционный текст
  final String instructionText =
      'Цели добавляются в статистику дорожной карты. '
      'Обозначьте цель на этот год, опишите контрольные точки её достижения и '
      'отслеживайте прогресс выполнения на общей карте. Помните, что цель должна быть '
      'реалистичная, конкретная, измеримая и имела дедлайн, также помните о легальности, '
      'экологичности и амбициозности';

  // Список сфер жизни
  final lifeSpheres = [
    'Личностный рост',
    'Карьера',
    'Любовь и отношения',
    'Окружение и общение',
    'Здоровье',
    'Внешний вид',
    'Развлечения и отдых',
    'Свободное время',
    'Финансы и бизнес',
    'Дружба'
  ];

  @override
  void onInit() {
    super.onInit();
    // По умолчанию инструкция свернута
    isInstructionExpanded.value = false;

    // Инициализация даты текущим днем
    final now = DateTime.now();
    final day = now.day.toString().padLeft(2, '0');
    final month = now.month.toString().padLeft(2, '0');
    final year = now.year.toString();
    deadlineController.value.text = '$day.$month.$year';

    // Добавляем слушатели для всех контроллеров полей
    titleController.value.addListener(_validateForm);
    specificController.value.addListener(_validateForm);
    measurableController.value.addListener(_validateForm);
    achievableController.value.addListener(_validateForm);
    relevantController.value.addListener(_validateForm);
    timeController.value.addListener(_validateForm);
    legalController.value.addListener(_validateForm);
    ethicalController.value.addListener(_validateForm);
    agreedController.value.addListener(_validateForm);
    flexibleController.value.addListener(_validateForm);
    deadlineController.value.addListener(_validateForm);
    lifeSphereController.value.addListener(_validateForm);
  }

  @override
  void onClose() {
    // Удаляем слушатели для всех контроллеров
    titleController.value.removeListener(_validateForm);
    specificController.value.removeListener(_validateForm);
    measurableController.value.removeListener(_validateForm);
    achievableController.value.removeListener(_validateForm);
    relevantController.value.removeListener(_validateForm);
    timeController.value.removeListener(_validateForm);
    legalController.value.removeListener(_validateForm);
    ethicalController.value.removeListener(_validateForm);
    agreedController.value.removeListener(_validateForm);
    flexibleController.value.removeListener(_validateForm);
    deadlineController.value.removeListener(_validateForm);
    lifeSphereController.value.removeListener(_validateForm);

    // Освобождаем ресурсы при закрытии контроллера
    titleController.value.dispose();
    specificController.value.dispose();
    measurableController.value.dispose();
    achievableController.value.dispose();
    relevantController.value.dispose();
    timeController.value.dispose();
    legalController.value.dispose();
    ethicalController.value.dispose();
    agreedController.value.dispose();
    flexibleController.value.dispose();
    deadlineController.value.dispose();
    lifeSphereController.value.dispose();

    super.onClose();
  }

  // Переключение состояния инструкции
  void toggleInstruction() {
    isInstructionExpanded.value = !isInstructionExpanded.value;
    logger.debug('Instruction expanded: ${isInstructionExpanded.value}');
  }

  // Проверка валидности формы
  void _validateForm() {
    // Проверяем заполнение всех полей
    final allFieldsFilled = titleController.value.text.isNotEmpty &&
        specificController.value.text.isNotEmpty &&
        measurableController.value.text.isNotEmpty &&
        achievableController.value.text.isNotEmpty &&
        relevantController.value.text.isNotEmpty &&
        timeController.value.text.isNotEmpty &&
        legalController.value.text.isNotEmpty &&
        ethicalController.value.text.isNotEmpty &&
        agreedController.value.text.isNotEmpty &&
        flexibleController.value.text.isNotEmpty &&
        deadlineController.value.text.isNotEmpty &&
        lifeSphereController.value.text.isNotEmpty;

    isFormValid.value = allFieldsFilled;
  }

  // Метод для перехода к контрольным точкам
  void goToCheckpoints() {
    if (formKey.currentState?.validate() ?? false) {
      logger.debug('Form validated, ready to proceed to checkpoints');

      // Переходим к экрану контрольных точек
      Get.toNamed(Routes.GOAL_CHECKPOINTS);
    } else {
      logger.debug('Form validation failed');
      Get.snackbar(
        'Ошибка',
        'Пожалуйста, заполните все обязательные поля',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
