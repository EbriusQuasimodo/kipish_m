import 'package:get/get.dart';
import 'package:kipish_m/routes/app_pages.dart';
import 'package:kipish_m/utils/base_controller.dart';

class CreateGoalController extends BaseController {
  // Состояние для отслеживания, развернута ли инструкция
  var isInstructionExpanded = true.obs;

  @override
  void onInit() {
    super.onInit();
    // По умолчанию инструкция развернута
    isInstructionExpanded.value = true;
  }

  // Метод для перехода к созданию цели по методике SMART LEAF
  void goToSmartLeafGoal() {
    Get.toNamed(Routes.SMART_LEAF_GOAL);
  }

  // Метод для переключения состояния инструкции
  void toggleInstruction() {
    isInstructionExpanded.value = !isInstructionExpanded.value;
    logger.debug('Instruction expanded: ${isInstructionExpanded.value}');
  }
}
