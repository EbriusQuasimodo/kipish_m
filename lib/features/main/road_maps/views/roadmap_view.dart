import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kipish_m/features/main/calendar/controllers/calendar_controller.dart';
import 'package:kipish_m/features/main/road_maps/controllers/roadmap_controller.dart';

class RoadmapView extends GetView<RoadmapController> {
  const RoadmapView({super.key});

  @override
  Widget build(BuildContext context) {
      Get.lazyPut<RoadmapController>(
      () => RoadmapController(),
    );
    return const Placeholder();
  }
}