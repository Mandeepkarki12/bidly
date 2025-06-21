import 'package:bidly/core/responsive_tools/dimensions.dart';
import 'package:bidly/core/theme/app_color.dart';
import 'package:bidly/core/theme/text_styles.dart';
import 'package:flutter/material.dart';

enum SnackBarType { success, warning, error }

void showCustomSnackBar(
  BuildContext context, {
  required String message,
  required SnackBarType type,
}) {
  final mediaQuery = MediaQuery.of(context);
  final screenWidth = mediaQuery.size.width;

  // Determine sizing based on device type
  double maxWidth;
  EdgeInsets padding;
  Alignment alignment;

  if (screenWidth < Dimensions.mobileWidth) {
    // Mobile
    maxWidth = screenWidth * 0.9;
    padding = const EdgeInsets.symmetric(horizontal: 16);
    alignment = Alignment.bottomCenter;
  } else if (screenWidth < Dimensions.tabletWidth) {
    // Tablet
    maxWidth = 500;
    padding = const EdgeInsets.symmetric(horizontal: 24);
    alignment = Alignment.topCenter;
  } else {
    // Desktop
    maxWidth = 600;
    padding = const EdgeInsets.symmetric(horizontal: 32);
    alignment = Alignment.topCenter;
  }

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
    margin: EdgeInsets.zero,
    padding: EdgeInsets.zero,
    content: Container(
      constraints: BoxConstraints(maxWidth: maxWidth),
      padding: padding,
      child: Align(
        alignment: alignment,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: borderColor, width: 2),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              icon,
              const SizedBox(width: 12),
              Flexible(
                child: Text(
                  message,
                  style: const AppTextStyles().baseBodySpaceMono.copyWith(
                        color: AppColors.backGroundPrimary,
                        fontSize:
                            screenWidth < Dimensions.tabletWidth ? 14 : 16,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
    duration: const Duration(seconds: 3),
  );

  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(snackBar);
}
