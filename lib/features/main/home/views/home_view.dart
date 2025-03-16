import 'dart:math';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:get/get.dart';
import 'package:kipish_m/features/main/home/controllers/home_controller.dart';
import 'package:kipish_m/features/main/home/widgets/home_pager.dart';
import 'package:kipish_m/services/app_theme.dart';
import 'package:kipish_m/utils/constants.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Get.find<AppThemeController>();

    return Obx(() {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          scrolledUnderElevation: 0,
          backgroundColor: theme.main_light,
          title: Text(controller.title.value,style: TextStyle(color: theme.main_dark,fontSize:  controller.selected_item.value == Constants.CALENDAR ? 20:32,fontWeight: FontWeight.w400),),
        ),
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Container(
                  color: theme.main_light,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      const HomePager(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  controller.selectItem(Constants.CALENDAR);
                },
                child: Container(
                  height: 40,
                  child: Column(
                    children: [
                      Icon(
                      TablerIcons.calendar_month,
                        size: 16,
                        color:
                            controller.selected_item.value == Constants.CALENDAR
                                ? theme.main_dark
                                : theme.accent_color_dark,
                      ),
                      Text(
                        'Календарь',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: controller.selected_item.value ==
                                  Constants.CALENDAR
                              ? theme.main_dark
                              : theme.accent_color_dark,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  controller.selectItem(Constants.ROADMAPS);
                },
                child: Container(
                  height: 40,
                  child: Column(
                    children: [
                      Icon(
                        Icons.add_road,
                        size: 16,
                        color:
                            controller.selected_item.value == Constants.ROADMAPS
                                ? theme.main_dark
                                : theme.accent_color_dark,
                      ),
                      Text(
                        'Дорожная карта',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: controller.selected_item.value ==
                                  Constants.ROADMAPS
                              ? theme.main_dark
                              : theme.accent_color_dark,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  controller.selectItem(Constants.PRIORITIES);
                },
                child: Container(
                  height: 40,
                  child: Column(
                    children: [
                      Icon(
                        Icons.menu,
                        size: 16,
                        color: controller.selected_item.value ==
                                Constants.PRIORITIES
                            ? theme.main_dark
                            : theme.accent_color_dark,
                      ),
                      Text(
                        'Приоритеты',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: controller.selected_item.value ==
                                  Constants.PRIORITIES
                              ? theme.main_dark
                              : theme.accent_color_dark,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  controller.selectItem(Constants.NEWS);
                },
                child: Container(
                  height: 40,
                  child: Column(
                    children: [
                      Icon(
                        Icons.newspaper,
                        size: 16,
                        color: controller.selected_item.value == Constants.NEWS
                            ? theme.main_dark
                            : theme.accent_color_dark,
                      ),
                      Text(
                        'Сообщество',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color:
                              controller.selected_item.value == Constants.NEWS
                                  ? theme.main_dark
                                  : theme.accent_color_dark,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
