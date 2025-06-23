import 'package:bidly/core/theme/app_color.dart';
import 'package:bidly/core/theme/text_styles.dart';
import 'package:flutter/material.dart';

class MobileBrowseCategories extends StatelessWidget {
  final String? imageUrl;
  final String? categoryName;
  const MobileBrowseCategories({super.key, this.imageUrl, this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.backGroundSecondary,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 150,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              child: Image.network(
                imageUrl ??
                    'https://images.pexels.com/photos/3768163/pexels-photo-3768163.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              categoryName ?? 'Titles',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const AppTextStyles().baseBodyWorkSans,
            ),
          ),
        ],
      ),
    );
  }
}
