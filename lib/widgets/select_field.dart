import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:get/get.dart';
import 'package:kipish_m/services/app_theme.dart';

class SelectField extends StatelessWidget {
  final String label;
  final String hintText;
  final TextEditingController controller;
  final List<String> options;
  final String? Function(String?)? validator;

  const SelectField({
    Key? key,
    required this.label,
    required this.hintText,
    required this.controller,
    required this.options,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Get.find<AppThemeController>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: theme.mainTextAccent.copyWith(color: theme.main_dark),
        ),
        const SizedBox(height: 2),
        InkWell(
          onTap: () => _showOptions(context),
          child: TextField(
            controller: controller,
            enabled: false,
            style:
                theme.mainTextRegular.copyWith(color: theme.accent_color_dark),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: theme.mainTextRegular
                  .copyWith(color: theme.accent_color_dark),
              disabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: theme.main_dark),
              ),
              suffixIcon:
                  Icon(TablerIcons.chevron_down, color: theme.main_dark),
              contentPadding: const EdgeInsets.symmetric(vertical: 12),
              isDense: true,
            ),
          ),
        ),
        const SizedBox(height: 32),
      ],
    );
  }

  void _showOptions(BuildContext context) {
    final theme = Get.find<AppThemeController>();

    showModalBottomSheet(
      context: context,
      backgroundColor: theme.main_light,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Text(
                  label,
                  style: theme.heading3,
                ),
              ),
              Divider(color: theme.accent_color_dark2),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: options.length,
                  itemBuilder: (context, index) {
                    final option = options[index];
                    return InkWell(
                      onTap: () {
                        controller.text = option;
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Text(
                          option,
                          style: theme.mainTextRegular
                              .copyWith(color: theme.main_dark),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
