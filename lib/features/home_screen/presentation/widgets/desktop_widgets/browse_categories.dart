import 'package:bidly/core/theme/app_color.dart';
import 'package:flutter/material.dart';

class BrowseCategories extends StatelessWidget {
  const BrowseCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.backGroundSecondary,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
