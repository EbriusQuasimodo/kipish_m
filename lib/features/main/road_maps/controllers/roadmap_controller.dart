import 'package:get/get.dart';
import 'package:kipish_m/utils/base_controller.dart';

class RoadmapController extends BaseController {
  // 0 - вкладка прогресса, 1 - вкладка календаря
  var activeTab = 0.obs;

  @override
  void onInit() {
    super.onInit();
    // Начальная инициализация
  }

  @override
  void onReady() {
    super.onReady();
    // Здесь можно загрузить данные с сервера при необходимости
    logger.debug('RoadmapController: onReady');
  }

  // Метод для переключения вкладок
  void setActiveTab(int tabIndex) {
    if (activeTab.value != tabIndex) {
      activeTab.value = tabIndex;
      logger.debug('RoadmapController: Переключение на вкладку $tabIndex');
    }
  }

  // Метод для создания новой цели
  void createGoal() {
    logger.debug('RoadmapController: Нажата кнопка "Создать цель"');
    // В будущем здесь будет логика создания цели
    // Например, открытие модального окна или навигация на другой экран

    // Временный диалог для демонстрации
    Get.defaultDialog(
      title: 'Создание цели',
      middleText: 'Эта функция находится в разработке.',
      textConfirm: 'OK',
      onConfirm: () => Get.back(),
    );
  }

  @override
  void onClose() {
    // Освобождение ресурсов при закрытии контроллера
    super.onClose();
  }
}
