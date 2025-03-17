// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemeData {
  int index;
  String name;
  int main_dark;
  int main_light;
  int accent_color;
  int accent_color_light;
  int accent_color_dark;
  int accent_color_dark2;
  AppThemeData({
    required this.index,
    required this.name,
    required this.main_light,
    required this.main_dark,
    required this.accent_color,
    required this.accent_color_light,
    required this.accent_color_dark,
    required this.accent_color_dark2,
  });
}

class AppThemeController extends GetxController {
   var themes = [AppThemeData(index: 0, name: 'Светлая', main_light: 0xFFFFFFFF, main_dark: 0xFF2B2B2B, accent_color: 0xFFE53838, accent_color_light: 0xFFF8F8F8, accent_color_dark: 0xFF8B8B8B, accent_color_dark2: 0xFFD9D9D9)].obs;
   final _main_dark = Color(0x00000000).obs;
   Color get main_dark => _main_dark.value;
     final _main_light = Color(0x00000000).obs;
   Color get main_light=> _main_light.value;
     final _accent_color = Color(0x00000000).obs;
   Color get accent_color => _accent_color.value;
     final _accent_color_light = Color(0x00000000).obs;
   Color get accent_color_light => _accent_color_light.value;
     final _accent_color_dark = Color(0x00000000).obs;
   Color get accent_color_dark => _accent_color_dark.value;
     final _accent_color_dark2 = Color(0x00000000).obs;
   Color get accent_color_dark2 => _accent_color_dark2.value;
  ThemeData _setTheme(AppThemeData themeData) {
       _main_dark.value = Color(themeData.main_dark);
    _main_light.value = Color(themeData.main_light);
    _accent_color.value = Color(themeData.accent_color);
    _accent_color_light.value = Color(themeData.accent_color_light);
    _accent_color_dark.value = Color(themeData.accent_color_dark);
    _accent_color_dark2.value = Color(themeData.accent_color_dark2);
    final theme = ThemeData(
      useMaterial3: true,
      fontFamily: 'GolosText',
      canvasColor: Colors.white,
      scaffoldBackgroundColor: Colors.white,
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
        displayColor: Colors.black,
      ),
      dividerTheme: DividerThemeData(color: Colors.grey),
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
            const EdgeInsets.symmetric(vertical: 8),
        hintStyle: TextStyle(
            fontSize: 16, color: Colors.grey, fontWeight: FontWeight.w400,height: 0),
      enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: main_dark),
        )
        ,
        outlineBorder: BorderSide(color: main_dark),
     border: UnderlineInputBorder(
          borderSide: BorderSide(color: main_dark),
        ),
        disabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: main_dark),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: main_dark),
        ),
        errorStyle: TextStyle(
          color: Colors.red,
          decorationColor: Colors.red,
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
              return Colors.grey;
            } else {
              return Colors.grey;
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
          backgroundColor: WidgetStatePropertyAll(Colors.white),
          side: WidgetStateProperty.resolveWith<BorderSide?>(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.pressed)) {
                return BorderSide(
                    color: Colors.grey,
                    width: 1,
                    strokeAlign: BorderSide.strokeAlignOutside);
              } else {
                return BorderSide(
                    color: Colors.grey,
                    width: 1,
                    strokeAlign: BorderSide.strokeAlignOutside);
              }
            },
          ),
          iconColor: WidgetStateProperty.resolveWith<Color?>(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.pressed)) {
                return Colors.grey;
              } else {
                return Colors.grey;
              }
            },
          ),
          foregroundColor: WidgetStateProperty.resolveWith<Color?>(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.pressed)) {
                return Colors.grey;
              } else {
                return Colors.grey;
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
                return BorderSide(color: Colors.grey, width: 1);
              } else {
                return BorderSide(color: Colors.grey, width: 1);
              }
            },
          ),
          iconColor: WidgetStateProperty.resolveWith<Color?>(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.pressed)) {
                return Colors.grey;
              } else {
                return Colors.grey;
              }
            },
          ),
          foregroundColor: WidgetStateProperty.resolveWith<Color?>(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.pressed)) {
                return Colors.grey;
              } else {
                return Colors.grey;
              }
            },
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                elevation: 0,
                iconColor: Colors.white,
                shadowColor: Colors.transparent,
                padding: EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)))
            .copyWith(
          overlayColor: WidgetStateProperty.resolveWith<Color?>(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.pressed)) {
                return Colors.grey;
              } else {
                return Colors.grey;
              }
            },
          ),
          backgroundColor: WidgetStateProperty.resolveWith<Color?>(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.pressed)) {
                return Colors.grey;
              } else {
                return Colors.grey;
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
    currentTheme = _setTheme(themes.first).obs;
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
