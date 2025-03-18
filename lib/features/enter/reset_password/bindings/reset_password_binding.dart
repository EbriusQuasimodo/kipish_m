import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:kipish_m/features/enter/reset_password/controllers/reset_password_controller.dart';

class ResetPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ResetPasswordController>(
      () => ResetPasswordController(),
      fenix: true,
    );
  }
}
