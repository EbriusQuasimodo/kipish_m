import 'package:get/get.dart';

import '../controllers/empty_page_controller.dart';

class EmptyPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EmptyPageController>(
      () => EmptyPageController(),
    );
  }
}
