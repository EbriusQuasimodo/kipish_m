import 'package:get/get.dart';
import 'package:kipish_m/features/main/calendar/controllers/calendar_controller.dart';
import 'package:kipish_m/utils/base_controller.dart';
import 'package:kipish_m/utils/constants.dart';

class HomeController extends BaseController {
  Rx<int> selected_item = (-100).obs;
  var title = "".obs;

  // Метод для удаления контроллеров при смене вкладки
  Future deleteControllers() async {
    //удаляем контроллеры каждой страницы
    if (Get.isRegistered<CalendarController>()) {
      await Get.delete<CalendarController>();
    }
  }

  Future selectItem(int tabId) async {
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
