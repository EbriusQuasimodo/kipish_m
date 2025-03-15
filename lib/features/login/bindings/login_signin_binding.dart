import 'package:get/get.dart';
import 'package:kipish_m/features/login/controllers/login_singing_controller.dart';


class LoginSigninBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginSigninController>(
      () => LoginSigninController(),
      fenix: true,
    );
  }
}
