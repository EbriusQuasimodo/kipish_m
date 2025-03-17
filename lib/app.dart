import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kipish_m/routes/app_pages.dart';
import 'package:kipish_m/services/app_theme.dart';
import 'package:talker_flutter/talker_flutter.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var themeController = Get.find<AppThemeController>();
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_ , child) {
        return MediaQuery(
          data: mediaQueryData.copyWith(textScaler: const TextScaler.linear(1.0)),
          child: Obx(() {
            Get.log("App STARTED");
            return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              onDispose: () {},
            
              // supportedLocales: AppFlowyEditorLocalizations.delegate.supportedLocales,
        
              initialRoute: AppPages.INITIAL,
              getPages: AppPages.routes,
              navigatorObservers: [
                TalkerRouteObserver(Get.find<Talker>()),
              ],
        
              theme: themeController.currentTheme.value,
              builder: (context, child) {
                if (child != null) {
                  return Column(
                    children: [
                      Expanded(
                        child: ClipRRect(child: child),
                      ),
                    ],
                  );
                }
                return child!;
              },
            );
          }),
        );
      }
    );
  }
}
