import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kipish_m/features/main/calendar/controllers/calendar_controller.dart';

class CalendarView extends GetView<CalendarController> {
  const CalendarView({super.key});

  @override
  Widget build(BuildContext context) {
      Get.lazyPut<CalendarController>(
      () => CalendarController(),
    );
    return const Placeholder();
  }
}