import 'package:bidly/core/theme/app_color.dart';
import 'package:bidly/core/theme/text_styles.dart';
import 'package:bidly/core/widgets/custom_rounded_button.dart';
import 'package:bidly/core/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomWebFooter extends StatelessWidget {
  const CustomWebFooter({super.key});
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
        color: AppColors.backGroundSecondary,
        height: 334,
        padding: EdgeInsets.symmetric(horizontal: width * 0.05),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: width * 0.25,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/app_logo.svg',
                            height: height * 0.04,
                            width: width * 0.04,
                          ),
                          SizedBox(width: width * 0.01),
                          Text('Bidly',
                              style: const AppTextStyles().h4SpaceMono),
                        ],
                      ),
                      SizedBox(height: height * 0.03),
                      Text(
                        'Bidly is a platform that allows you to buy and sell digital assets.',
                        style: const AppTextStyles(
                                color: AppColors.backGroundTertiary)
                            .baseBodyWorkSans,
                      ),
                      SizedBox(height: height * 0.01),
                      Text(
                        'Join Our Community',
                        style: const AppTextStyles(
                                color: AppColors.backGroundTertiary)
                            .baseBodyWorkSans,
                      ),
                      SizedBox(height: height * 0.01),
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/discord.svg',
                            height: height * 0.04,
                            width: width * 0.04,
                          ),
                          SizedBox(width: width * 0.01),
                          SvgPicture.asset(
                            'assets/icons/twitter.svg',
                            height: height * 0.03,
                            width: width * 0.03,
                          ),
                          SizedBox(width: width * 0.01),
                          SvgPicture.asset(
                            'assets/icons/instagram.svg',
                            height: height * 0.03,
                            width: width * 0.03,
                          ),
                        ],
                      )
                    ],
                  ),
                ),

                // EXPLORE
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Explore',
                      style: const AppTextStyles().h4SpaceMono,
                    ),
                    SizedBox(height: height * 0.03),
                    Text(
                      'Marketplace',
                      style: const AppTextStyles(
                              color: AppColors.backGroundTertiary)
                          .baseBodyWorkSans,
                    ),
                    SizedBox(height: height * 0.02),
                    Text(
                      'Ranking',
                      style: const AppTextStyles(
                              color: AppColors.backGroundTertiary)
                          .baseBodyWorkSans,
                    ),
                    SizedBox(height: height * 0.02),
                    Text(
                      'Connect a Wallet',
                      style: const AppTextStyles(
                              color: AppColors.backGroundTertiary)
                          .baseBodyWorkSans,
                    ),
                  ],
                ),
                // CONTACT US
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Contact Us',
                      style: const AppTextStyles().h4SpaceMono,
                    ),
                    SizedBox(height: height * 0.03),
                    Text('Contact us for any inquiries or support.',
                        style: const AppTextStyles(
                                color: AppColors.backGroundTertiary)
                            .baseBodyWorkSans),
                    SizedBox(height: height * 0.02),
                    // custom Textfield
                    SizedBox(
                        height: height * 0.06,
                        width: width * 0.3,
                        child: CustomTextField(
                          suffix: CustomRoundedButton(
                            radius: 20,
                            onTap: () {},
                            height: height * 0.06,
                            width: width * 0.1,
                            color: AppColors.primaryButton,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.send,
                                  size: height * 0.02,
                                  color: AppColors.primaryText,
                                ),
                                SizedBox(width: width * 0.003),
                                Text('Send',
                                    style:
                                        const AppTextStyles().baseBodyWorkSans)
                              ],
                            ),
                          ),
                          borderRadius: 20,
                          borderColor: AppColors.primaryText,
                          borderWidth: 1,
                          hintText: 'Enter your email',
                          hintStyle: const AppTextStyles(color: Colors.black)
                              .baseBodyWorkSans,
                        ))
                  ],
                )
              ],
            ),
            SizedBox(height: height * 0.03),
            Divider(
              color: AppColors.backGroundTertiary,
              thickness: 1,
              height: height * 0.01,
            ),
            SizedBox(height: height * 0.02),
            Text(
              'Ⓒ 2025 Bidly. All rights reserved.',
              style: const AppTextStyles(color: AppColors.backGroundTertiary)
                  .baseBodyWorkSans,
            ),
          ],
        ));
  }
}
