import 'package:get/get.dart';
import 'package:kipish_m/features/main/road_maps/controllers/roadmap_controller.dart';

class RoadmapBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RoadmapController>(
      () => RoadmapController(),
      fenix: true, // Сохраняет экземпляр, пока он нужен TODO: обусдить с Настей
    );
  }
}
