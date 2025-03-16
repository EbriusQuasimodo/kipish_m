import 'package:get/get.dart';
import 'package:kipish_m/features/main/calendar/controllers/calendar_controller.dart';
import 'package:kipish_m/utils/base_controller.dart';
import 'package:kipish_m/utils/constants.dart';

class HomeController extends BaseController {
  Rx<int> selected_item = (-100).obs;
  var title = "".obs;
  Future deleteControllers() async {
    //удаляем контроллеры каждой страницы
    if (Get.isRegistered<CalendarController>()) {
      await Get.delete<CalendarController>();
    }
  }

  Future selectItem(p0) async {
    await deleteControllers();
    selected_item.value = p0;

    selected_item.refresh();
//кастомная навигация из навбара
    if (p0 == Constants.CALENDAR) {
      title.value = "Расписание";
    } else if (p0 == Constants.ROADMAPS) {
      title.value = "Дорожные карты";
    }
  }

  getReady() {
    selectItem(Constants.CALENDAR);
  }

  @override
  void onInit() {
    getReady();
    super.onInit();
  }
}
