import 'package:bidly/core/theme/app_color.dart';
import 'package:bidly/core/theme/text_styles.dart';
import 'package:flutter/material.dart';

enum SnackBarType { success, warning, error }

void showCustomSnackBar(
  BuildContext context, {
  required String message,
  required SnackBarType type,
}) {
  Color bgColor;
  Color borderColor;
  Icon icon;

  switch (type) {
    case SnackBarType.success:
      bgColor = Colors.green.shade50;
      borderColor = Colors.green;
      icon = const Icon(Icons.check_circle, color: Colors.green, size: 28);
      break;
    case SnackBarType.warning:
      bgColor = Colors.orange.shade50;
      borderColor = Colors.orange;
      icon = const Icon(Icons.error_outline, color: Colors.orange, size: 28);
      break;
    case SnackBarType.error:
      bgColor = Colors.red.shade50;
      borderColor = Colors.red;
      icon = const Icon(Icons.error_outline, color: Colors.red, size: 28);
      break;
  }

  final snackBar = SnackBar(
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    elevation: 0,
    content: Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor, width: 2),
      ),
      child: Row(
        children: [
          icon,
          const SizedBox(width: 12),
          Expanded(
            child: Center(
              child: Text(
                message,
                style: const AppTextStyles().baseBodySpaceMono.copyWith(
                      color: AppColors.backGroundPrimary,
                    ),
              ),
            ),
          ),
        ],
      ),
    ),
    duration: const Duration(seconds: 3),
  );

  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(snackBar);
}
