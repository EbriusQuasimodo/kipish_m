import 'dart:math';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
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
          backgroundColor: Colors.white,
          title: Text(controller.title.value),
        ),
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Container(
                  color: Colors.white,
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
                onTap: (){
                  controller.selectItem(Constants.CALENDAR);
                },
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                      color: controller.selected_item.value == Constants.CALENDAR
                          ? Colors.grey
                          : Colors.transparent),
                  child: Column(
                    children: [Icon(Icons.calendar_month,size: 16,), Text('Календарь',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400),)],
                  ),
                ),
              ),
              GestureDetector(
                 onTap: (){
                  controller.selectItem(Constants.ROADMAPS);
                },
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                      color: controller.selected_item.value == Constants.ROADMAPS
                          ? Colors.grey
                          : Colors.transparent),
                  child: Column(
                    children: [Icon(Icons.add_road,size: 16,), Text('Дорожная карта',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400),)],
                  ),
                ),
              ),
               GestureDetector(
                 onTap: (){
                  controller.selectItem(Constants.PRIORITIES);
                },
                 child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                      color: controller.selected_item.value == Constants.PRIORITIES
                          ? Colors.grey
                          : Colors.transparent),
                  child: Column(
                    children: [Icon(Icons.menu,size: 16,), Text('Приоритеты',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400),)],
                  ),
                               ),
               ),
               GestureDetector(
                 onTap: (){
                  controller.selectItem(Constants.NEWS);
                },
                 child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                      color: controller.selected_item.value == Constants.NEWS
                          ? Colors.grey
                          : Colors.transparent),
                  child: Column(
                    children: [Icon(Icons.newspaper,size: 16,), Text('Сообщество',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400),)],
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
