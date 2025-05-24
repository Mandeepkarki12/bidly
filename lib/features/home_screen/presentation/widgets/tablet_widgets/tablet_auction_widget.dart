import 'package:bidly/core/theme/app_color.dart';
import 'package:bidly/core/theme/text_styles.dart';
import 'package:bidly/core/widgets/custom_rounded_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:octo_image/octo_image.dart';

class TabletAuctionWidget extends StatelessWidget {
  const TabletAuctionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: 560,
      width: width,
      child: Stack(
        children: [
          Positioned.fill(
            child: OctoImage(
              image: const NetworkImage(
                'https://images.pexels.com/photos/2385477/pexels-photo-2385477.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
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
          Positioned(
              left: 30,
              right: 30,
              bottom: 60,
              child: SizedBox(
                height: 250,
                width: width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomRoundedButton(
                        radius: 20,
                        onTap: () {},
                        width: 151,
                        height: 44,
                        color: AppColors.backGroundSecondary,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
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
                            )
                          ],
                        )),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Nike Products',
                              style: const AppTextStyles().h3WorkSans,
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            CustomRoundedButton(
                                onTap: () => {},
                                height: 60,
                                width: 198,
                                color: AppColors.primaryText,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.remove_red_eye_outlined,
                                      color: AppColors.primaryButton,
                                      size: 23,
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      'View',
                                      style: const AppTextStyles(
                                              color:
                                                  AppColors.backGroundSecondary)
                                          .baseBodyWorkSans,
                                    )
                                  ],
                                ))
                          ],
                        ),
                        Container(
                          height: 149,
                          width: 295,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 48, vertical: 20),
                          decoration: BoxDecoration(
                              color: AppColors.backGroundSecondary
                                  .withOpacity(0.5),
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Auction ends in',
                                    style:
                                        const AppTextStyles().captionSpaceMono),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text('00:00:00',
                                    style: const AppTextStyles().h3SpaceMono),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text('Hours   Minutes    Seconds',
                                    style: const AppTextStyles()
                                        .captionSpaceMono
                                        .copyWith(color: AppColors.primaryText))
                              ]),
                        )
                      ],
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
