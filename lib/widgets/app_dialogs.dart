import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kipish_m/services/app_theme.dart';
import 'package:kipish_m/widgets/accent_button.dart';

class AppDialogs {
  // Уведомление с одной кнопкой
  static void showNotification({
    required String title,
    required String message,
    String buttonText = 'Понятно',
    VoidCallback? onButtonPressed,
  }) {
    final theme = Get.find<AppThemeController>();

    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 0,
        backgroundColor: theme.main_light,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Заголовок
              Text(
                title,
                style: theme.heading3,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),

              // Содержимое
              Text(
                message,
                style: theme.mainTextRegular,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 24),

              // Кнопка
              SizedBox(
                width: double.infinity,
                height: 36,
                child: AccentButton(
                  text: buttonText,
                  onPressed: () {
                    Get.back();
                    if (onButtonPressed != null) {
                      onButtonPressed();
                    }
                  },
                  backgroundColor: theme.accent_color,
                  textColor: theme.main_light,
                ),
              ),
            ],
          ),
        ),
      ),
      barrierDismissible: true,
    );
  }

  // Диалог подтверждения с двумя кнопками
  static void showConfirmation({
    required String title,
    required String message,
    String confirmText = 'Подтвердить',
    String cancelText = 'Отмена',
    required VoidCallback onConfirm,
    VoidCallback? onCancel,
  }) {
    final theme = Get.find<AppThemeController>();

    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 0,
        backgroundColor: theme.main_light,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Заголовок
              Text(
                title,
                style: theme.heading3,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),

              // Содержимое
              Text(
                message,
                style: theme.mainTextRegular,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 24),

              // Кнопки
              Row(
                children: [
                  // Кнопка отмены
                  Expanded(
                    child: SizedBox(
                      height: 36,
                      child: AccentButton(
                        text: cancelText,
                        onPressed: () {
                          Get.back();
                          if (onCancel != null) {
                            onCancel();
                          }
                        },
                        backgroundColor: theme.accent_color_light,
                        textColor: theme.main_dark,
                      ),
                    ),
                  ),
                  SizedBox(width: 16),

                  // Кнопка подтверждения
                  Expanded(
                    child: SizedBox(
                      height: 36,
                      child: AccentButton(
                        text: confirmText,
                        onPressed: () {
                          Get.back();
                          onConfirm();
                        },
                        backgroundColor: theme.accent_color,
                        textColor: theme.main_light,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      barrierDismissible: true,
    );
  }

  // Модальное окно с выбором из списка
  static void showSelectionList<T>({
    required String title,
    required List<T> items,
    required String Function(T) itemText,
    required void Function(T) onItemSelected,
    String cancelText = 'Отмена',
  }) {
    final theme = Get.find<AppThemeController>();

    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 0,
        backgroundColor: theme.main_light,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Заголовок
              Text(
                title,
                style: theme.heading3,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),

              // Список элементов
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: Get.height * 0.4, // Максимальная высота списка
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: items
                        .map((item) => InkWell(
                              onTap: () {
                                Get.back();
                                onItemSelected(item);
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12),
                                child: Text(
                                  itemText(item),
                                  style: theme.mainTextRegular,
                                ),
                              ),
                            ))
                        .toList(),
                  ),
                ),
              ),

              SizedBox(height: 24),

              // Кнопка отмены
              SizedBox(
                width: double.infinity,
                height: 36,
                child: AccentButton(
                  text: cancelText,
                  onPressed: () => Get.back(),
                  backgroundColor: theme.accent_color_light,
                  textColor: theme.main_dark,
                ),
              ),
            ],
          ),
        ),
      ),
      barrierDismissible: true,
    );
  }

  // Информационное сообщение без точек выбора (пустой список)
  static void showEmptyListMessage({
    required String title,
    required String message,
    String buttonText = 'Понятно',
  }) {
    showNotification(
      title: title,
      message: message,
      buttonText: buttonText,
    );
  }
}
