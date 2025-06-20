import 'package:bidly/core/theme/app_color.dart';
import 'package:bidly/core/theme/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:octo_image/octo_image.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({super.key});
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: width * 0.24,
      height: 470,
      decoration: BoxDecoration(
        color: AppColors.backGroundPrimary,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 296,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              child: OctoImage(
                image: const NetworkImage(
                  'https://images.pexels.com/photos/3768163/pexels-photo-3768163.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                ),
                width: 24,
                height: 24,
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
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.01),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Title ',
                  style: const AppTextStyles().h5WorkSans,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 12,
                      backgroundColor: AppColors.backGroundTertiary,
                      child: ClipOval(
                        child: OctoImage(
                          image: const NetworkImage(
                            'https://images.pexels.com/photos/3768163/pexels-photo-3768163.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
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
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Price: ',
                        style: const AppTextStyles(color: Color(0xFF858584))
                            .captionSpaceMono),
                    Text('Higest Bid: ',
                        style: const AppTextStyles(color: Color(0xFF858584))
                            .captionSpaceMono),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('0.01 ETH',
                        style: const AppTextStyles().baseBodySpaceMono),
                    Text('0.01 ETH',
                        style: const AppTextStyles().baseBodySpaceMono),
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
