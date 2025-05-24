import 'package:bidly/core/theme/app_color.dart';
import 'package:bidly/core/theme/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:octo_image/octo_image.dart';

class DesktopTrendingAuctions extends StatelessWidget {
 
  const DesktopTrendingAuctions({
    super.key,
   
  });
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
     width : width *0.24,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 270,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: OctoImage(
                image: const NetworkImage(
                  'https://images.pexels.com/photos/1212053/pexels-photo-1212053.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                ),
                fit: BoxFit.cover,
                placeholderBuilder: (context) =>
                    const CupertinoActivityIndicator(),
                errorBuilder: (context, error, stackTrace) => const Icon(
                  Icons.error_outline_outlined,
                  color: Colors.red,
                  size: 24,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Top Seller',
                  style: const AppTextStyles().h5WorkSans,
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 12,
                      backgroundColor: AppColors.backGroundTertiary,
                      child: ClipOval(
                        child: OctoImage(
                          image: const NetworkImage(
                            'https://images.pexels.com/photos/921646/pexels-photo-921646.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                          ),
                          width: 24,
                          height: 24,
                          fit: BoxFit.cover,
                          placeholderBuilder: (context) =>
                              const CupertinoActivityIndicator(),
                          errorBuilder: (context, error, stackTrace) =>
                              const Icon(
                            Icons.error_outline_outlined,
                            color: Colors.red,
                            size: 24,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      'John Doe',
                      style: const AppTextStyles().baseBodyWorkSans,
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
