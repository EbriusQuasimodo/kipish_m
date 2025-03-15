// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppThemeData {
  IconData icon;
  int index;
  String name;

  AppThemeData({
    required this.icon,
    required this.index,
    required this.name,
  
  });
}

class AppThemeController extends GetxController {
 ThemeData _setTheme() {
    final theme = ThemeData(
      useMaterial3: true,
      fontFamily: 'Inter',
      canvasColor:  Colors.white,
      scaffoldBackgroundColor:  Colors.white,
      textTheme: const TextTheme(
        labelLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          fontFeatures: <FontFeature>[
            FontFeature.caseSensitiveForms(),
          ],
        ),
        headlineLarge: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w500,
          fontFeatures: <FontFeature>[
            FontFeature.caseSensitiveForms(),
          ],
        ),
        headlineMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          fontFeatures: <FontFeature>[
            FontFeature.caseSensitiveForms(),
          ],
        ),
        bodyLarge: TextStyle(
          fontFeatures: <FontFeature>[
            FontFeature.caseSensitiveForms(),
          ],
        ),
        bodyMedium: TextStyle(
          fontFeatures: <FontFeature>[
            FontFeature.caseSensitiveForms(),
          ],
        ),
        bodySmall: TextStyle(
          fontFeatures: <FontFeature>[
            FontFeature.caseSensitiveForms(),
          ],
        ),
      ).apply(
        bodyColor: Colors.black,
        displayColor:  Colors.black,
      ),
      dividerTheme: DividerThemeData(color:  Colors.grey),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: Colors.grey,
      ),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: Colors.white,
        filled: true,
        iconColor: Colors.grey,
        isDense: true,
        errorMaxLines: 4,
        hoverColor: Colors.transparent,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        hintStyle: TextStyle(
            fontSize: 16, color:  Colors.grey, fontWeight: FontWeight.w400),
        border: OutlineInputBorder(
          borderSide: BorderSide(color:  Colors.grey),
          borderRadius: BorderRadius.circular(12),
        ),
       
        outlineBorder: BorderSide(color:  Colors.grey),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color:  Colors.grey),
          borderRadius: BorderRadius.circular(12),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color:  Colors.grey),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color:  Colors.blue),
            borderRadius: BorderRadius.circular(12),
        
         
        ),
        errorStyle: TextStyle(
          color:  Colors.red,
          decorationColor:  Colors.red,
          fontWeight: FontWeight.w400,
          fontSize: 14,
        ),
      ),
      scrollbarTheme: ScrollbarThemeData(
          trackColor: WidgetStatePropertyAll(Colors.transparent),
          trackBorderColor: WidgetStatePropertyAll(Colors.transparent),
          trackVisibility: WidgetStatePropertyAll(true),
          thumbVisibility: const WidgetStatePropertyAll(true),
          thickness: const WidgetStatePropertyAll(0),
          mainAxisMargin: 0,
          crossAxisMargin: 0,
          minThumbLength: 4,
          thumbColor: WidgetStatePropertyAll(Colors.transparent),
          radius: const Radius.circular(26)),
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        textStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          height: 0,
        ),
      ).copyWith(
        overlayColor: WidgetStatePropertyAll(Colors.transparent),
        backgroundColor: WidgetStatePropertyAll(Colors.transparent),
        foregroundColor: WidgetStateProperty.resolveWith<Color?>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.pressed)) {
              return  Colors.grey;
            } else {
              return  Colors.grey;
            }
          },
        ),
      )),
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
                padding: EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)))
            .copyWith(
          overlayColor: WidgetStatePropertyAll(Colors.transparent),
          backgroundColor: WidgetStatePropertyAll( Colors.white),
          side: WidgetStateProperty.resolveWith<BorderSide?>(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.pressed)) {
                return BorderSide(color:  Colors.grey, width: 1,strokeAlign: BorderSide.strokeAlignOutside);
              } else {
                return BorderSide(color:  Colors.grey, width: 1,strokeAlign: BorderSide.strokeAlignOutside);
              }
            },
          ),
          iconColor: WidgetStateProperty.resolveWith<Color?>(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.pressed)) {
                return  Colors.grey;
              } else {
                return  Colors.grey;
              }
            },
          ),
          foregroundColor: WidgetStateProperty.resolveWith<Color?>(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.pressed)) {
                return  Colors.grey;
              } else {
                return  Colors.grey;
              }
            },
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
                padding: EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)))
            .copyWith(
          overlayColor: WidgetStatePropertyAll(Colors.transparent),
          backgroundColor: WidgetStatePropertyAll(Colors.transparent),
          side: WidgetStateProperty.resolveWith<BorderSide?>(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.pressed)) {
                return BorderSide(color:  Colors.grey, width: 1);
              } else {
                return BorderSide(color:  Colors.grey, width: 1);
              }
            },
          ),
          iconColor: WidgetStateProperty.resolveWith<Color?>(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.pressed)) {
                return  Colors.grey;
              } else {
                return  Colors.grey;
              }
            },
          ),
          foregroundColor: WidgetStateProperty.resolveWith<Color?>(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.pressed)) {
                return  Colors.grey;
              } else {
                return  Colors.grey;
              }
            },
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
                foregroundColor:  Colors.white,
                elevation: 0,
                iconColor:  Colors.white,
                shadowColor: Colors.transparent,
                padding: EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)))
            .copyWith(
          overlayColor: WidgetStateProperty.resolveWith<Color?>(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.pressed)) {
                return  Colors.grey;
              } else {
                return  Colors.grey;
              }
            },
          ),
          backgroundColor: WidgetStateProperty.resolveWith<Color?>(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.pressed)) {
                return  Colors.grey;
              } else {
                return  Colors.grey;
              }
            },
          ),
        ),
      ),
    );

    return theme;
}

  late Rx<ThemeData> currentTheme;
 

  @override
  void onInit() {
   
    currentTheme = _setTheme().obs;
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
