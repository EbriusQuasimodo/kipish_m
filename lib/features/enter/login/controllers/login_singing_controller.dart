import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:kipish_m/utils/base_controller.dart';

class LoginSigninController extends BaseController {
  var firstEnter = true.obs;
  var obscureFirstPassword = true.obs;

  var obscureSecondPassword = true.obs;
   var login = TextEditingController().obs;
   var firstPassword = TextEditingController().obs;
   var secondPassword = TextEditingController().obs;
var userRegistered=true.obs;

 }