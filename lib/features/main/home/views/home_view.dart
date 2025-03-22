import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:get/get.dart';
import 'package:kipish_m/features/main/create_goal/views/create_goal_view.dart';
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
        // Единый AppBar для всех состояний
        appBar: AppBar(
          scrolledUnderElevation: 0,
          backgroundColor: theme.main_light,
          // Кнопка назад только для экрана создания цели
          leading: controller.isCreatingGoal.value
              ? GestureDetector(
                  onTap: () => controller.exitCreateGoalMode(),
                  child: Icon(TablerIcons.chevron_left,
                      color: theme.main_dark, size: 28),
                )
              : null,
          title: Text(
            controller.title.value,
            style: controller.isCreatingGoal.value
                ? theme.heading2
                : (controller.selected_item.value == Constants.ROADMAPS
                    ? theme.heading1
                    : TextStyle(
                        color: theme.main_dark,
                        fontSize:
                            controller.selected_item.value == Constants.CALENDAR
                                ? 20
                                : 32,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'GolosText',
                      )),
          ),
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
                      // Используем IndexedStack для переключения между экранами
                      IndexedStack(
                        index: controller.isCreatingGoal.value ? 1 : 0,
                        children: [
                          // Основной контент приложения
                          const HomePager(),

                          // Экран создания цели
                          const CreateGoalView(),
                        ],
                      ),
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
