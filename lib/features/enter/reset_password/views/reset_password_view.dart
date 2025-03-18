import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:get/get.dart';
import 'package:kipish_m/features/enter/reset_password/controllers/reset_password_controller.dart';
import 'package:kipish_m/routes/app_pages.dart';
import 'package:kipish_m/services/app_theme.dart';

class ResetPasswordView extends GetView<ResetPasswordController> {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Get.find<AppThemeController>();
    return Scaffold(
        backgroundColor: theme.main_light,
        body: LayoutBuilder(builder: (context, constraints) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: SafeArea(
              child: LayoutBuilder(builder: (context, constraints) {
                return Obx(() {
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
                                child: Builder(builder: (context) {
                                  return Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Center(
                                        child: Text(
                                          'Восстановить доступ',
                                          style: TextStyle(
                                              fontSize: 24.sp,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 50,
                                      ),
                                       if (controller.addEmail.value)...[
                                      Text(
                                        'Введите Email',
                                        style: TextStyle(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      TextFormField(
                                        decoration: InputDecoration(
                                            hintText: 'Ваш Email'),
                                      ),]else...
                                      [
                                        SizedBox(
                                          height: 14,
                                        ),
                                        Text(
                                          'Введите новый пароль',
                                          style: TextStyle(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        TextFormField(
                                          obscureText: controller
                                              .obscureFirstPassword.value,
                                          decoration: InputDecoration(
                                              hintText: 'Ваш пароль',
                                              suffixIcon: GestureDetector(
                                                  onTap: () {
                                                    controller
                                                            .obscureFirstPassword
                                                            .value =
                                                        !controller
                                                            .obscureFirstPassword
                                                            .value;
                                                  },
                                                  child: Icon(
                                                    controller
                                                            .obscureFirstPassword
                                                            .value
                                                        ? TablerIcons.eye_off
                                                        : TablerIcons.eye,
                                                    size: 24,
                                                    color: theme.main_dark,
                                                  ))),
                                        ),
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
                                          controller:
                                              controller.secondPassword.value,
                                          obscureText: controller
                                              .obscureSecondPassword.value,
                                          decoration: InputDecoration(
                                              hintText: 'Ваш пароль',
                                              suffixIcon: GestureDetector(
                                                  onTap: () {
                                                    controller
                                                            .obscureSecondPassword
                                                            .value =
                                                        !controller
                                                            .obscureSecondPassword
                                                            .value;
                                                  },
                                                  child: Icon(
                                                    controller
                                                            .obscureSecondPassword
                                                            .value
                                                        ? TablerIcons.eye_off
                                                        : TablerIcons.eye,
                                                    size: 24,
                                                    color: theme.main_dark,
                                                  ))),
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
                                                backgroundColor:
                                                    theme.main_dark,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            40))),
                                            onPressed: () {
                                              controller.addEmail.value = false;
                                            },
                                            child: Text(
                                           controller.addEmail.value  ? 'Сбросить пароль' :'Сохранить и войти',
                                              style: TextStyle(
                                                  color: theme.main_light,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 16.sp),
                                            )),
                                      ),
                                    ],
                                  );
                                }),
                              ),
                            ),
                            if(! controller.addEmail.value)
                            Column(
                              children: [
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
                                           Get.offAllNamed(Routes.LOGIN_SIGNIN, );
                                      },
                                      child: Text(
                                        'Я вспомнил пароль',
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
                });
              }),
            ),
          );
        }));
  }
}
