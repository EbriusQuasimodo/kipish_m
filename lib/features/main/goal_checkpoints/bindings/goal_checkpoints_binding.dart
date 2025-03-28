import 'package:get/get.dart';
import 'package:kipish_m/features/main/goal_checkpoints/controllers/goal_checkpoints_controller.dart';

class GoalCheckpointsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GoalCheckpointsController>(
      () => GoalCheckpointsController(),
    );
  }
}
