import 'package:get/get.dart';
import 'package:kipish_m/features/main/home/controllers/home_controller.dart';
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

    // Получаем экземпляр HomeController для клиент-навигации
    final homeController = Get.find<HomeController>();

    // Вызываем метод для перехода в режим создания цели
    homeController.showCreateGoalScreen();
  }

  @override
  void onClose() {
    // Освобождение ресурсов при закрытии контроллера
    super.onClose();
  }
}
