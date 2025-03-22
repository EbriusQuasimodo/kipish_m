import 'package:get/get.dart';
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

  // Метод для переключения состояния инструкции
  void toggleInstruction() {
    isInstructionExpanded.value = !isInstructionExpanded.value;
    logger.debug('Instruction expanded: ${isInstructionExpanded.value}');
  }
}
