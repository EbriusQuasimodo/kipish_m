import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kipish_m/routes/app_pages.dart';
import 'package:talker_flutter/talker_flutter.dart';

class SplashController extends GetxController {
  final logger = Get.find<Talker>();

  @override
  void onInit() {
    super.onInit();
  }

 @override
  void onReady() {
    super.onReady();
    // var queryParameters = <String, String>{};

    // try {
    //   var uri = Uri.parse(Get.currentRoute);
    //   queryParameters = uri.queryParameters;
    // } catch (e) {}

    // print(">>>>>>SAPLSH ${queryParameters["invitation_code"]}");
    // print(">>>>>>SAPLSH ${queryParameters["email_secure_code"]}");

    // final box = GetStorage();
    // box.write("invitation_code", queryParameters["invitation_code"] ?? "");
    // box.write("email_secure_code", queryParameters["email_secure_code"] ?? "");

    // final user = database.getUser();
    // logger.debug("splash>> ${user}");
    // if (user == null) {
    //   Get.offAllNamed(Routes.LOGIN_SIGNIN, arguments: ["", queryParameters]);
    // } else {
    //   // user.api_token = "das";
    //   // database.putUser(user);
    //   Get.offAllNamed(Routes.HOME, arguments: [1, queryParameters]);
    // }
        Get.offAllNamed(Routes.HOME, );
  }


  @override
  void onClose() {
    super.onClose();
  }
}
