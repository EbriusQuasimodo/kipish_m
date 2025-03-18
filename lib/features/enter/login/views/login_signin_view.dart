import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:get/get.dart';
import 'package:kipish_m/features/enter/login/controllers/login_singing_controller.dart';
import 'package:kipish_m/features/enter/login/views/start_view.dart';
import 'package:kipish_m/routes/app_pages.dart';
import 'package:kipish_m/services/app_theme.dart';

class LoginSigninView extends GetView<LoginSigninController> {
  const LoginSigninView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Get.find<AppThemeController>();
    return Obx(() {
      if (controller.firstEnter.value) {
        return StartView();
      } else {
        return Scaffold(
           backgroundColor: theme.main_light,
          body:Padding(
            padding: const EdgeInsets.all(16.0),
            child: SafeArea(
              child: LayoutBuilder(builder: (context, constraints) {
                return Obx(
                 () {
                    return SingleChildScrollView(
                      child: ConstrainedBox(
                        constraints:
                            BoxConstraints(minHeight: constraints.maxHeight),
                        child: IntrinsicHeight(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Center(
                                  child: Builder(
                                    builder: (context) {
                                      return Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Center(
                                            child: Text(
                                              'Авторизация',
                                              style: TextStyle(
                                                  fontSize: 24.sp,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 50,
                                          ),
                                          Text(
                                            'Введите Email',
                                            style: TextStyle(
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          TextFormField(
                                            decoration:
                                                InputDecoration(hintText: 'Ваш Email'),
                                          ),
                                          SizedBox(
                                            height: 14,
                                          ),
                                          Text(
                                            'Введите пароль',
                                            style: TextStyle(
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.w500),
                                          ),
                                         TextFormField(
                                                obscureText:
                                                    controller.obscureFirstPassword.value,
                                                decoration: InputDecoration(
                                                    hintText: 'Ваш пароль',
                                                    suffixIcon: GestureDetector(
                                                      onTap: () {
                                                        controller.obscureFirstPassword
                                                                .value =
                                                            !controller
                                                                .obscureFirstPassword.value;
                                                      },
                                                      child:  Icon(
                                                            controller
                                                                    .obscureFirstPassword.value
                                                                ? TablerIcons.eye_off
                                                                : TablerIcons.eye,
                                                            size: 24,
                                                            color: theme.main_dark,
                                                          )
                                                    )),
                                             
                                          ),
                                          if(!controller.userRegistered.value)...[
                                             SizedBox(
                                            height: 14,
                                          ),
                                          Text(
                                            'Повторите пароль',
                                            style: TextStyle(
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.w500),
                                          ),
                                         TextFormField(
                                                controller: controller.secondPassword.value,
                                                obscureText:
                                                    controller.obscureSecondPassword.value,
                                                decoration: InputDecoration(
                                                    hintText: 'Ваш пароль',
                                                    suffixIcon: GestureDetector(
                                                      onTap: () {
                                                        controller.obscureSecondPassword
                                                                .value =
                                                            !controller
                                                                .obscureSecondPassword.value;
                                                      },
                                                      child:  Icon(
                                                            controller
                                                                    .obscureSecondPassword.value
                                                                ? TablerIcons.eye_off
                                                                : TablerIcons.eye,
                                                            size: 24,
                                                            color: theme.main_dark,
                                                          )
                                                    )),
                                              
                                          ),
                                          ],
                                          SizedBox(
                                            height: 50,
                                          ),
                                          SizedBox(
                                            height: 48,
                                            width: context.width,
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor: theme.main_dark,
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(40))),
                                                onPressed: () {
                                                  controller.firstEnter.value = false;
                                                },
                                                child: Text(
                                                  'Войти',
                                                  style: TextStyle(
                                                      color: theme.main_light,
                                                      fontWeight: FontWeight.w500,
                                                      fontSize: 16.sp),
                                                )),
                                          ),
                                          Center(
                                            child: TextButton(
                                                onPressed: () {
                                                     Get.offAllNamed(Routes.RESET_PASSWORD, );
                                                },
                                                child: Text(
                                                  'Забыли пароль?',
                                                  style: TextStyle(
                                                      color: theme.accent_color_dark,
                                                      fontWeight: FontWeight.w400,
                                                      fontSize: 16),
                                                )),
                                          )
                                        ],
                                      );
                                    }
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  Center(
                                    child: Text(
                                    controller.userRegistered.value?   'Нет аккаунта?':'Уже зарегистрированы?',
                                      style: TextStyle(
                                          color: theme.accent_color_dark,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  SizedBox(
                                    height: 48,
                                    width: context.width,
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                theme.accent_color_light,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(40))),
                                        onPressed: () {
                                         controller.userRegistered.value=! controller.userRegistered.value;
                                        },
                                        child: Text(
                                         controller.userRegistered.value?  'Зарегистрироваться' : 'Войти',
                                          style: TextStyle(
                                              color: theme.main_dark,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16.sp),
                                        )),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }
                );
              }),
            ),
          ),
        );
      }
    });
  }
}
