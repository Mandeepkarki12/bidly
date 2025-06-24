import 'package:bidly/core/theme/app_color.dart';
import 'package:bidly/core/theme/text_styles.dart';
import 'package:flutter/material.dart';

class DesktopBrowseCategories extends StatelessWidget {
  final String? imageUrl ;
  final String? title ;
  
  const DesktopBrowseCategories({super.key, 
    this.imageUrl,
    this.title,
  });

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
            height: 230,
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
          const SizedBox(height: 25,),
          Text(
            title??
            'Titles', maxLines: 1, overflow: TextOverflow.ellipsis,style:const  AppTextStyles().h5WorkSans,),
        ],
      ),
    );
  }
}
