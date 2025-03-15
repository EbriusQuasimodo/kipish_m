import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart' as getx;
import 'package:talker_flutter/talker_flutter.dart';

class BaseController extends getx.GetxController {
  var logger = Get.find<Talker>();

  @override
  void onInit() {
    // TODO: implement onInit

    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
