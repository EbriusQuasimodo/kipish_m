import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kipish_m/features/main/calendar/views/calendar_view.dart';
import 'package:kipish_m/features/main/empty_page/views/empty_page_view.dart';
import 'package:kipish_m/features/main/home/controllers/home_controller.dart';
import 'package:kipish_m/features/main/road_maps/views/roadmap_view.dart';
import 'package:kipish_m/utils/constants.dart';

class HomePager extends StatelessWidget {
  const HomePager({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return Obx(() {
      if (controller.selected_item.value == Constants.CALENDAR) {
        return CalendarView();
      }else if(controller.selected_item.value == Constants.ROADMAPS){return RoadmapView();} else {
        return EmptyPageView();
      }
    });
  }
}
