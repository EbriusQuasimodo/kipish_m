import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kipish_m/features/enter/login/controllers/login_singing_controller.dart';
import 'package:kipish_m/services/app_theme.dart';

class StartView extends StatelessWidget {
  const StartView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Get.find<AppThemeController>();
    final controller = Get.find<LoginSigninController>();
    return Material(
      child: Stack(
        fit: StackFit.expand,
        children: [
          ColorFiltered(
            colorFilter: ColorFilter.matrix(<double>[
              0.2126,
              0.7152,
              0.0722,
              0,
              0,
              0.2126,
              0.7152,
              0.0722,
              0,
              0,
              0.2126,
              0.7152,
              0.0722,
              0,
              0,
              0,
              0,
              0,
              1,
              0,
            ]),
            child: Image.asset(
              'assets/images/peoples.jpeg',
              fit: BoxFit.cover,
              colorBlendMode: BlendMode.srcOver,
              color: Color(0x33000000),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset('assets/images/red_bg.png'),
                    Padding(
                      padding: const EdgeInsets.only(top: 90.0),
                      child: Center(
                          child: Text(
                        'Управление кипящей жизнью',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'Uncage',
                            fontSize: 32.sp,
                            fontWeight: FontWeight.w400,
                            color: theme.main_light),
                      )),
                    )
                  ],
                ),
              ),
              Container(
                margin:
                    EdgeInsets.only(left: 16, right: 16, bottom: 50, top: 20),
                    height: 48, 
                width: context.width,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: theme.accent_color,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40))),
                    onPressed: () {controller.firstEnter.value=false;},
                    child: Text(
                      'Начать',
                      style: TextStyle(
                          color: theme.main_light,
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp),
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
