import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kipish_m/features/main/road_maps/controllers/roadmap_controller.dart';
import 'package:kipish_m/services/app_theme.dart';
import 'package:kipish_m/widgets/accent_button.dart';

class RoadmapView extends GetView<RoadmapController> {
  const RoadmapView({super.key});

  @override
  Widget build(BuildContext context) {
    // Получаем доступ к темам
    final theme = Get.find<AppThemeController>();

    // Lazy инициализация контроллера
    Get.lazyPut<RoadmapController>(() => RoadmapController());

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Уменьшено расстояние между заголовком и переключателями
          SizedBox(height: 10.h),

          // Переключатель прогресс/календарь
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Кнопка "прогресс"
              Obx(() => GestureDetector(
                    onTap: () => controller.setActiveTab(0),
                    child: Container(
                      // Уменьшен padding переключателя
                      padding:
                          EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
                      decoration: BoxDecoration(
                        color: controller.activeTab.value == 0
                            ? theme.main_dark
                            : theme.accent_color_light,
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: Text(
                        'прогресс',
                        style: controller.activeTab.value == 0
                            ? theme.activeTabText
                            : theme
                                .inactiveTabText, //TODO: Убратть эти стили и заменить
                      ),
                    ),
                  )),

              // Уменьшено расстояние между переключателями
              SizedBox(width: 8.w),

              // Кнопка "календарь"
              Obx(() => GestureDetector(
                    onTap: () => controller.setActiveTab(1),
                    child: Container(
                      // Уменьшен padding переключателя
                      padding:
                          EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
                      decoration: BoxDecoration(
                        color: controller.activeTab.value == 1
                            ? theme.main_dark
                            : theme.accent_color_light,
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: Text(
                        'календарь',
                        style: controller.activeTab.value == 1
                            ? theme.activeTabText
                            : theme.inactiveTabText,
                      ),
                    ),
                  )),
            ],
          ),

          // Скорректировано расстояние между переключателями и описанием
          SizedBox(height: 35.h),

          // Основной контент (отображается в зависимости от выбранной вкладки)
          Obx(() => controller.activeTab.value == 0
              ? _buildProgressTab(theme)
              : _buildCalendarTab(theme)),
        ],
      ),
    );
  }

  // Вкладка прогресса
  Widget _buildProgressTab(AppThemeController theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Текст с описанием
        Text(
          'Добавьте долгосрочную цель, чтобы запланировать эффективные улучшения, добавить расписание и организовать привычки',
          style: theme.mainTextRegular,
        ),

        SizedBox(height: 20.h),

        // Кнопка "Создать цель"
        AccentButton(
          text: 'Создать цель',
          onPressed: () => controller.createGoal(),
        ),
      ],
    );
  }

  // Вкладка календаря
  Widget _buildCalendarTab(AppThemeController theme) {
    // В будущем здесь будет реализация календаря
    return Center(
      child: Text(
        'Календарь находится в разработке',
        style: theme.mainTextRegular.copyWith(color: theme.accent_color_dark),
      ),
    );
  }
}
