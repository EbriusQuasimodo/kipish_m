import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kipish_m/utils/base_controller.dart';

class ResetPasswordController extends BaseController{
  var addEmail =true.obs;
  var email = TextEditingController().obs;
  var obscureFirstPassword = true.obs;

  var obscureSecondPassword = true.obs;
   var firstPassword = TextEditingController().obs;
   var secondPassword = TextEditingController().obs;
}