import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kipish_m/services/app_theme.dart';
import 'package:talker_flutter/talker_flutter.dart';

initLogger() {
  final talker = TalkerFlutter.init(
    logger: TalkerLogger(
        settings: TalkerLoggerSettings(
            // enableColors: false,
            )),
    settings: TalkerSettings(),
  );
  Get.put<Talker>(talker);
}
initCore() async {
  Get.find<Talker>().debug("Initialization");
  Get.log = defaultLogWriterCallback;
  Get.put<AppThemeController>(AppThemeController());
}
Future coreFunctions() async {
//для андроида потом надо сертификаты поставить (возмонжо)
  //  await certificate();
  
initLogger();
await initCore();
  await GetStorage.init();
}
