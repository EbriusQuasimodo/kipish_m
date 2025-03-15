import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kipish_m/services/app_theme.dart';

import '../controllers/empty_page_controller.dart';

class EmptyPageView extends GetView<EmptyPageController> {
  const EmptyPageView({super.key});
  @override
  Widget build(BuildContext context) {
    final theme = Get.find<AppThemeController>();
    return Container(
        
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                 
                  Text(
                    'Раздел в разработке',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Мы трудимся над данным функционалом...\nСовсем скоро откроем доступ!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.fromLTRB(16, 0, 16, 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
              ),
            ),
          ],
        ),
      );
 
  }
}
