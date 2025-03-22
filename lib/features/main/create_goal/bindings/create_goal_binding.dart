import 'package:get/get.dart';
import 'package:kipish_m/features/main/create_goal/controllers/create_goal_controller.dart';

class CreateGoalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateGoalController>(
      () => CreateGoalController(),
      fenix: true,
    );
  }
}
