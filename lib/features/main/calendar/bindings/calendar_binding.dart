import 'package:get/get.dart';
import 'package:kipish_m/features/main/calendar/controllers/calendar_controller.dart';


class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CalendarController>(
      () => CalendarController(),
    );
  }
}
