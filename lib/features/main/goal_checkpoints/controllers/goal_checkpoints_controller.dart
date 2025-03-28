import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kipish_m/routes/app_pages.dart';
import 'package:kipish_m/utils/base_controller.dart';
import 'package:kipish_m/widgets/app_dialogs.dart';

class GoalCheckpointsController extends BaseController {
  // Состояние для отслеживания, развернута ли инструкция
  var isInstructionExpanded = false.obs;

  // Состояние для отслеживания валидности формы
  var isFormValid = false.obs;

  // Контроллер для начальной точки
  var initialCheckpointController = TextEditingController();

  // Список контрольных точек, кроме начальной
  var checkpoints = <CheckpointItem>[].obs;

  // Форм-ключ для валидации
  final formKey = GlobalKey<FormState>();

  // Инструкционный текст
  final String instructionText =
      'Контрольные точки — это ключевые этапы достижения целей, которые помогают '
      'отслеживать достижение основной цели. Сформулируйте вашу начальную точку, '
      'какие навыки помогут достичь цели, какое состояние, положение у вас сейчас';

  @override
  void onInit() {
    super.onInit();
    // По умолчанию инструкция свернута
    isInstructionExpanded.value = false;

    // Добавляем первую контрольную точку по умолчанию
    checkpoints.add(CheckpointItem(
      titleController: TextEditingController(),
      dateController: TextEditingController(),
    ));

    // Инициализация даты текущим днем для всех контрольных точек
    final now = DateTime.now();
    final day = now.day.toString().padLeft(2, '0');
    final month = now.month.toString().padLeft(2, '0');
    final year = now.year.toString();

    // Устанавливаем дату для первой контрольной точки
    checkpoints[0].dateController.text = '$day.$month.$year';

    // Добавляем слушатель для начальной точки
    initialCheckpointController.addListener(_validateForm);

    // Добавляем слушатели для других точек
    for (var checkpoint in checkpoints) {
      checkpoint.titleController.addListener(_validateForm);
      checkpoint.dateController.addListener(_validateForm);
    }
  }

  @override
  void onClose() {
    // Удаляем слушатели
    initialCheckpointController.removeListener(_validateForm);

    // Освобождаем ресурсы контроллеров
    initialCheckpointController.dispose();

    for (var checkpoint in checkpoints) {
      checkpoint.titleController.removeListener(_validateForm);
      checkpoint.dateController.removeListener(_validateForm);

      checkpoint.titleController.dispose();
      checkpoint.dateController.dispose();
    }

    super.onClose();
  }

  // Переключение состояния инструкции
  void toggleInstruction() {
    isInstructionExpanded.value = !isInstructionExpanded.value;
    logger.debug('Instruction expanded: ${isInstructionExpanded.value}');
  }

  // Добавление новой контрольной точки
  void addCheckpoint() {
    final now = DateTime.now();
    final day = now.day.toString().padLeft(2, '0');
    final month = now.month.toString().padLeft(2, '0');
    final year = now.year.toString();

    // Создаем новую контрольную точку
    final newCheckpoint = CheckpointItem(
      titleController: TextEditingController(),
      dateController: TextEditingController()..text = '$day.$month.$year',
    );

    // Добавляем слушатели для новой точки
    newCheckpoint.titleController.addListener(_validateForm);
    newCheckpoint.dateController.addListener(_validateForm);

    // Добавляем в список
    checkpoints.add(newCheckpoint);

    // Проверяем валидность формы
    _validateForm();
  }

  // Проверка валидности формы
  void _validateForm() {
    // Проверяем заполнение начальной точки
    final isInitialValid = initialCheckpointController.text.isNotEmpty;

    // Проверяем заполнение всех контрольных точек
    bool areCheckpointsValid = true;
    for (var checkpoint in checkpoints) {
      if (checkpoint.titleController.text.isEmpty ||
          checkpoint.dateController.text.isEmpty) {
        areCheckpointsValid = false;
        break;
      }
    }

    // Обновляем состояние валидности
    isFormValid.value = isInitialValid && areCheckpointsValid;
  }

  // Метод для связывания с существующей контрольной точкой
  void linkWithExistingCheckpoint(int index) {
    // Используем общий компонент диалога
    AppDialogs.showEmptyListMessage(
        title: 'Нет доступных точек',
        message: 'У вас пока нет сохраненных контрольных точек для связывания');
  }

  // Метод для сохранения всех контрольных точек
  void saveCheckpoints() {
    if (formKey.currentState?.validate() ?? false) {
      // TODO: Здесь будет отправка данных на сервер
      logger.debug('Сохранение контрольных точек');

      // Показываем сообщение об успехе
      Get.snackbar(
        'Успех',
        'Контрольные точки сохранены',
        snackPosition: SnackPosition.BOTTOM,
      );

      // Возвращаемся к экрану целей
      Get.until((route) => Get.currentRoute.contains(Routes.CREATE_GOAL));
    } else {
      logger.debug('Проверка формы не пройдена');
      Get.snackbar(
        'Ошибка',
        'Пожалуйста, заполните все поля',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}

// Класс для хранения данных одной контрольной точки
class CheckpointItem {
  final TextEditingController titleController;
  final TextEditingController dateController;

  CheckpointItem({
    required this.titleController,
    required this.dateController,
  });
}
