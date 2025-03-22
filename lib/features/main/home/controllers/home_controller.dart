// lib/features/main/home/controllers/home_controller.dart
import 'package:get/get.dart';
import 'package:kipish_m/features/main/calendar/controllers/calendar_controller.dart';
import 'package:kipish_m/features/main/create_goal/controllers/create_goal_controller.dart';
import 'package:kipish_m/utils/base_controller.dart';
import 'package:kipish_m/utils/constants.dart';

class HomeController extends BaseController {
  Rx<int> selected_item = (-100).obs;
  var title = "".obs;
  // Флаг для режима создания цели
  var isCreatingGoal = false.obs;
  // Сохраняем предыдущий заголовок
  var previousTitle = "";
  // Сохраняем предыдущий выбранный элемент
  var previousSelectedItem = (-100).obs;

  // Метод для удаления контроллеров при смене вкладки
  Future deleteControllers() async {
    //удаляем контроллеры каждой страницы
    if (Get.isRegistered<CalendarController>()) {
      await Get.delete<CalendarController>();
    }
  }

  // Переход на другой таб нижней навигации
  Future selectItem(int tabId) async {
    // Если мы в режиме создания цели, выходим из него
    if (isCreatingGoal.value) {
      exitCreateGoalMode();
    }

    await deleteControllers();
    selected_item.value = tabId;
    selected_item.refresh();

    // Устанавливаем заголовок в зависимости от выбранного таба
    if (tabId == Constants.CALENDAR) {
      title.value = "Расписание";
    } else if (tabId == Constants.ROADMAPS) {
      title.value = "ROAD MAP";
    } else if (tabId == Constants.PRIORITIES) {
      title.value = "Приоритеты";
    } else if (tabId == Constants.NEWS) {
      title.value = "Сообщество";
    }
  }

  // Активация режима создания цели
  void showCreateGoalScreen() {
    // Запоминаем текущее состояние для возможности возврата
    previousTitle = title.value;
    previousSelectedItem.value = selected_item.value;

    // Устанавливаем новое состояние
    title.value = "Новая цель";
    isCreatingGoal.value = true;

    // Инициализируем контроллер, если нужно
    if (!Get.isRegistered<CreateGoalController>()) {
      Get.put(CreateGoalController());
    }

    logger.debug("Entering create goal mode");
  }

  // Выход из режима создания цели
  void exitCreateGoalMode() {
    // Восстанавливаем предыдущее состояние
    title.value = previousTitle;
    isCreatingGoal.value = false;

    logger.debug("Exiting create goal mode");
  }

  // Навигация к экрану создания цели (можно вызвать из любого места)
  void navigateToCreateGoal() {
    // Сначала переходим на таб дорожных карт, если не там
    if (selected_item.value != Constants.ROADMAPS) {
      selectItem(Constants.ROADMAPS);
    }

    // Затем активируем режим создания цели
    showCreateGoalScreen();
  }

  // Инициализация
  getReady() {
    selectItem(Constants.CALENDAR);
  }

  @override
  void onInit() {
    getReady();
    super.onInit();
  }
}
