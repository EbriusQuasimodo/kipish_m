import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:get/get.dart';
import 'package:kipish_m/services/app_theme.dart';

class DatePickerField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const DatePickerField({
    Key? key,
    required this.label,
    required this.controller,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Get.find<AppThemeController>();

    return Column(
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
            style:
                theme.mainTextRegular.copyWith(color: theme.accent_color_dark),
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
        const SizedBox(height: 16),
      ],
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final theme = Get.find<AppThemeController>();

    // Получаем текущую дату из контроллера или используем сегодняшнюю
    DateTime currentDate;
    try {
      final parts = controller.text.split('.');
      if (parts.length == 3) {
        currentDate = DateTime(
            int.parse(parts[2]), int.parse(parts[1]), int.parse(parts[0]));
      } else {
        currentDate = DateTime.now();
      }
    } catch (e) {
      currentDate = DateTime.now();
    }

    // Массивы с названиями
    final russianMonthNames = [
      'Январь',
      'Февраль',
      'Март',
      'Апрель',
      'Май',
      'Июнь',
      'Июль',
      'Август',
      'Сентябрь',
      'Октябрь',
      'Ноябрь',
      'Декабрь'
    ];

    final List<int> years =
        List.generate(10, (index) => DateTime.now().year + index);

    // Создаем временную переменную для хранения выбранной даты
    DateTime selectedDate = currentDate;

    // Показываем кастомный Bottom Sheet для выбора даты
    await showModalBottomSheet(
      context: context,
      backgroundColor: theme.main_light,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      isScrollControlled: true,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Селектор месяца
                      DropdownButton<int>(
                        value: selectedDate.month,
                        items: List.generate(12, (index) {
                          return DropdownMenuItem(
                            value: index + 1,
                            child: Text(
                              russianMonthNames[index],
                              style: theme.mainTextRegular
                                  .copyWith(color: theme.main_dark),
                            ),
                          );
                        }),
                        onChanged: (value) {
                          if (value != null) {
                            setState(() {
                              selectedDate = DateTime(
                                selectedDate.year,
                                value,
                                selectedDate.day,
                              );
                            });
                          }
                        },
                      ),

                      // Селектор года
                      DropdownButton<int>(
                        value: selectedDate.year,
                        items: years.map((year) {
                          return DropdownMenuItem(
                            value: year,
                            child: Text(
                              year.toString(),
                              style: theme.mainTextRegular
                                  .copyWith(color: theme.main_dark),
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          if (value != null) {
                            setState(() {
                              selectedDate = DateTime(
                                value,
                                selectedDate.month,
                                selectedDate.day,
                              );
                            });
                          }
                        },
                      ),
                    ],
                  ),

                  SizedBox(height: 16),

                  // Календарная сетка с днями
                  Expanded(
                    child: _buildCalendarGrid(
                        context, selectedDate, setState, theme),
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
                          Navigator.pop(context, selectedDate);
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

  // Вспомогательная функция для построения календарной сетки
  Widget _buildCalendarGrid(BuildContext context, DateTime selectedDate,
      StateSetter setState, AppThemeController theme) {
    // Названия дней недели в сокращенном формате
    final weekdays = ['Пн', 'Вт', 'Ср', 'Чт', 'Пт', 'Сб', 'Вс'];

    // Получаем первый день месяца
    final firstDayOfMonth = DateTime(selectedDate.year, selectedDate.month, 1);

    // Получаем день недели для первого дня (0 - понедельник, 6 - воскресенье)
    int firstWeekday = firstDayOfMonth.weekday - 1;

    // Количество дней в текущем месяце
    final daysInMonth =
        DateTime(selectedDate.year, selectedDate.month + 1, 0).day;

    // Определяем сегодняшнюю дату для подсветки
    final today = DateTime.now();
    final isCurrentMonth =
        today.year == selectedDate.year && today.month == selectedDate.month;

    return Column(
      children: [
        // Строка с названиями дней недели
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: weekdays
              .map((day) => Text(
                    day,
                    style:
                        theme.mainTextAccent.copyWith(color: theme.main_dark),
                  ))
              .toList(),
        ),
        SizedBox(height: 8),
        Expanded(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7, // 7 дней в неделе
            ),
            itemCount:
                42, // 6 недель по 7 дней (максимально возможное количество для отображения месяца)
            itemBuilder: (context, index) {
              // Индекс дня месяца (1-31)
              final dayIndex = index - firstWeekday;

              // Проверяем, принадлежит ли день текущему месяцу
              if (dayIndex < 0 || dayIndex >= daysInMonth) {
                return Container(); // Пустая ячейка для дней из других месяцев
              }

              final day = dayIndex + 1;
              final isSelected = day == selectedDate.day;
              final isToday = isCurrentMonth && day == today.day;

              // Проверяем, не раньше ли выбранный день, чем сегодня
              bool isBeforeToday = false;
              if (selectedDate.year < today.year) {
                isBeforeToday = true;
              } else if (selectedDate.year == today.year &&
                  selectedDate.month < today.month) {
                isBeforeToday = true;
              } else if (selectedDate.year == today.year &&
                  selectedDate.month == today.month &&
                  day < today.day) {
                isBeforeToday = true;
              }

              return GestureDetector(
                onTap: isBeforeToday
                    ? null
                    : () {
                        setState(() {
                          selectedDate = DateTime(
                              selectedDate.year, selectedDate.month, day);
                        });
                      },
                child: Container(
                  decoration: BoxDecoration(
                    color: isSelected ? theme.main_dark : null,
                    border:
                        isToday ? Border.all(color: theme.accent_color) : null,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  margin: EdgeInsets.all(2),
                  alignment: Alignment.center,
                  child: Text(
                    day.toString(),
                    style: theme.mainTextRegular.copyWith(
                      color: isSelected
                          ? theme.main_light
                          : (isBeforeToday
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
