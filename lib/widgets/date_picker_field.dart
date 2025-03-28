import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:get/get.dart';
import 'package:kipish_m/services/app_theme.dart';

class DatePickerField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final double bottomPadding;

  const DatePickerField({
    Key? key,
    required this.label,
    required this.controller,
    this.validator,
    this.bottomPadding = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Get.find<AppThemeController>();

    return Padding(
      padding: EdgeInsets.only(bottom: bottomPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: theme.mainTextAccent.copyWith(color: theme.main_dark),
          ),
          const SizedBox(height: 2),
          InkWell(
            onTap: () => _selectDate(context),
            child: TextField(
              controller: controller,
              enabled: false,
              style: theme.mainTextRegular
                  .copyWith(color: theme.accent_color_dark),
              decoration: InputDecoration(
                disabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: theme.main_dark),
                ),
                suffixIcon: Icon(
                  TablerIcons.calendar,
                  color: theme.main_dark,
                  size: 24,
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 12),
                isDense: true,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final theme = Get.find<AppThemeController>();

    // Парсим текущую дату из контроллера или используем сегодняшнюю
    DateTime initialDate;
    try {
      final parts = controller.text.split('.');
      if (parts.length == 3) {
        initialDate = DateTime(
          int.parse(parts[2]), // год
          int.parse(parts[1]), // месяц
          int.parse(parts[0]), // день
        );
      } else {
        initialDate = DateTime.now();
      }
    } catch (e) {
      initialDate = DateTime.now();
    }

    // Создаем переменную для отслеживания текущей выбранной даты
    Rx<DateTime> selectedDate = initialDate.obs;

    await showModalBottomSheet(
      context: context,
      backgroundColor: theme.main_light,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      isScrollControlled: true,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            return Container(
              padding: EdgeInsets.all(16),
              height: MediaQuery.of(context).size.height * 0.7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Text(
                      'Выберите дату',
                      style: theme.heading3,
                    ),
                  ),
                  Divider(color: theme.accent_color_dark2),

                  // Строка выбора месяца и года
                  Obx(() => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Выбор месяца
                          DropdownButton<int>(
                            value: selectedDate.value.month,
                            items: [
                              DropdownMenuItem(value: 1, child: Text('Январь')),
                              DropdownMenuItem(
                                  value: 2, child: Text('Февраль')),
                              DropdownMenuItem(value: 3, child: Text('Март')),
                              DropdownMenuItem(value: 4, child: Text('Апрель')),
                              DropdownMenuItem(value: 5, child: Text('Май')),
                              DropdownMenuItem(value: 6, child: Text('Июнь')),
                              DropdownMenuItem(value: 7, child: Text('Июль')),
                              DropdownMenuItem(value: 8, child: Text('Август')),
                              DropdownMenuItem(
                                  value: 9, child: Text('Сентябрь')),
                              DropdownMenuItem(
                                  value: 10, child: Text('Октябрь')),
                              DropdownMenuItem(
                                  value: 11, child: Text('Ноябрь')),
                              DropdownMenuItem(
                                  value: 12, child: Text('Декабрь')),
                            ],
                            onChanged: (int? newMonth) {
                              if (newMonth != null) {
                                // Определяем максимальный день для нового месяца
                                int daysInNewMonth = DateTime(
                                  selectedDate.value.year,
                                  newMonth + 1,
                                  0,
                                ).day;

                                // Если текущий день больше максимального дня в новом месяце,
                                // то устанавливаем день на максимальный
                                int newDay = selectedDate.value.day;
                                if (newDay > daysInNewMonth) {
                                  newDay = daysInNewMonth;
                                }

                                selectedDate.value = DateTime(
                                  selectedDate.value.year,
                                  newMonth,
                                  newDay,
                                );
                              }
                            },
                          ),

                          // Выбор года
                          DropdownButton<int>(
                            value: selectedDate.value.year,
                            items: List.generate(10, (index) {
                              int year = DateTime.now().year + index;
                              return DropdownMenuItem(
                                value: year,
                                child: Text(year.toString()),
                              );
                            }),
                            onChanged: (int? newYear) {
                              if (newYear != null) {
                                // Проверяем на 29 февраля в високосном году
                                if (selectedDate.value.month == 2 &&
                                    selectedDate.value.day == 29) {
                                  bool isLeapYear = (newYear % 4 == 0 &&
                                          newYear % 100 != 0) ||
                                      (newYear % 400 == 0);
                                  if (!isLeapYear) {
                                    selectedDate.value =
                                        DateTime(newYear, 2, 28);
                                    return;
                                  }
                                }

                                selectedDate.value = DateTime(
                                  newYear,
                                  selectedDate.value.month,
                                  selectedDate.value.day,
                                );
                              }
                            },
                          ),
                        ],
                      )),

                  SizedBox(height: 16),

                  // Календарная сетка
                  Expanded(
                    child: Obx(
                        () => _buildCalendarGrid(context, selectedDate, theme)),
                  ),

                  // Кнопки действий
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Отмена',
                          style: theme.mainTextAccent
                              .copyWith(color: theme.main_dark),
                        ),
                      ),
                      SizedBox(width: 16),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context, selectedDate.value);
                        },
                        child: Text(
                          'ОК',
                          style: theme.mainTextAccent
                              .copyWith(color: theme.main_dark),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    ).then((result) {
      if (result != null) {
        final DateTime picked = result as DateTime;
        final day = picked.day.toString().padLeft(2, '0');
        final month = picked.month.toString().padLeft(2, '0');
        final year = picked.year.toString();
        controller.text = '$day.$month.$year';
      }
    });
  }

  Widget _buildCalendarGrid(BuildContext context, Rx<DateTime> selectedDate,
      AppThemeController theme) {
    // Названия дней недели
    final weekdays = ['Пн', 'Вт', 'Ср', 'Чт', 'Пт', 'Сб', 'Вс'];

    // Первый день месяца
    final firstDayOfMonth =
        DateTime(selectedDate.value.year, selectedDate.value.month, 1);

    // День недели для первого дня (1-7, где 1 - понедельник, 7 - воскресенье)
    final firstWeekday = firstDayOfMonth.weekday;

    // Количество дней в месяце
    final daysInMonth =
        DateTime(selectedDate.value.year, selectedDate.value.month + 1, 0).day;

    // Сегодняшний день для подсветки
    final today = DateTime.now();
    final isCurrentMonth = today.year == selectedDate.value.year &&
        today.month == selectedDate.value.month;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Названия дней недели
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: weekdays
              .map((day) => SizedBox(
                    width: 30,
                    child: Center(
                      child: Text(
                        day,
                        style: theme.mainTextAccent
                            .copyWith(color: theme.main_dark),
                      ),
                    ),
                  ))
              .toList(),
        ),

        SizedBox(height: 8),

        // Календарная сетка
        Expanded(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              childAspectRatio: 1.0,
            ),
            itemCount: 42, // 6 недель по 7 дней
            itemBuilder: (context, index) {
              // Вычисляем день месяца (1-31)
              int dayOffset = index - (firstWeekday - 1);
              int day = dayOffset + 1;

              // Если день выходит за рамки текущего месяца, показываем пустую ячейку
              if (dayOffset < 0 || day > daysInMonth) {
                return Container();
              }

              // Является ли этот день выбранным
              bool isSelected = day == selectedDate.value.day;

              // Является ли этот день сегодняшним
              bool isToday = isCurrentMonth && day == today.day;

              // Проверяем, не раньше ли день, чем сегодня
              bool isPastDay = false;
              DateTime dayDate = DateTime(
                  selectedDate.value.year, selectedDate.value.month, day);
              if (dayDate
                  .isBefore(DateTime(today.year, today.month, today.day))) {
                isPastDay = true;
              }

              return GestureDetector(
                onTap: isPastDay
                    ? null
                    : () {
                        // Обновляем выбранную дату при нажатии
                        selectedDate.value = DateTime(
                          selectedDate.value.year,
                          selectedDate.value.month,
                          day,
                        );
                      },
                child: Container(
                  margin: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: isSelected ? theme.main_dark : null,
                    border:
                        isToday ? Border.all(color: theme.accent_color) : null,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    day.toString(),
                    style: theme.mainTextRegular.copyWith(
                      color: isSelected
                          ? theme.main_light
                          : (isPastDay
                              ? theme.accent_color_dark
                              : theme.main_dark),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
