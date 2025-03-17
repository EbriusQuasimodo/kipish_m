import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kipish_m/features/login/controllers/login_singing_controller.dart';
import 'package:kipish_m/features/login/views/start_view.dart';
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
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
              
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          'Авторизация',
                          style:
                              TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w500),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Text(
                        'Введите Email',
                        style:
                            TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
                      ),
                      TextFormField(
                        decoration: InputDecoration(hintText: 'Ваш Email'),
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      Text(
                        'Введите пароль',
                        style:
                            TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
                      ),
                      TextFormField(
                        decoration: InputDecoration(hintText: 'Ваш пароль'),
                      ),
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
                                    borderRadius: BorderRadius.circular(40))),
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
                            onPressed: () {},
                            child: Text(
                              'Забыли пароль?',
                              style: TextStyle(
                                  color: theme.accent_color_dark,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16),
                            )),
                      )
                    ],
                  ),
                    Column(
                      children: [
                        Center(
                              child:  Text(
                                    'Нет аккаунта?',
                                    style: TextStyle(
                                        color: theme.accent_color_dark,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16),
                                  ),
                            ),
                             SizedBox(height: 12,),
                                       SizedBox(
                          height: 48,
                          width: context.width,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: theme.accent_color_light,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(40))),
                              onPressed: () {
                                controller.firstEnter.value = false;
                              },
                              child: Text(
                                'Зарегистрироваться',
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
    });
  }
}
