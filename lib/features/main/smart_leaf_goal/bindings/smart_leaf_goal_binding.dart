import 'package:get/get.dart';
import 'package:kipish_m/features/main/smart_leaf_goal/controllers/smart_leaf_goal_controller.dart';

class SmartLeafGoalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SmartLeafGoalController>(
      () => SmartLeafGoalController(),
    );
  }
}
