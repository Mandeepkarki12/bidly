import 'package:bidly/core/theme/app_color.dart';
import 'package:bidly/core/theme/text_styles.dart';
import 'package:bidly/core/widgets/custom_rounded_button.dart';
import 'package:bidly/core/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomMobileFooter extends StatelessWidget {
  const CustomMobileFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: width * 0.05, vertical: 10),
      height: 800,
      width: double.infinity,
      color: AppColors.backGroundSecondary,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                'assets/icons/app_logo.svg',
                height: 40,
                width: width * 0.04,
              ),
              SizedBox(width: width * 0.02),
              Text('Bidly', style: const AppTextStyles().h4SpaceMono),
            ],
          ),
          const SizedBox(height: 30),
          Text(
            'Bidly is a platform that allows you to buy and sell digital assets.',
            style: const AppTextStyles(color: AppColors.backGroundTertiary)
                .baseBodyWorkSans,
          ),
          const SizedBox(height: 15),
          Text(
            'Join Our Community',
            style: const AppTextStyles(color: AppColors.backGroundTertiary)
                .baseBodyWorkSans,
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              SvgPicture.asset(
                'assets/icons/discord.svg',
                height: 30,
                width: 30,
              ),
              SizedBox(width: width * 0.03),
              SvgPicture.asset(
                'assets/icons/twitter.svg',
                height: 28,
                width: 28,
              ),
              SizedBox(width: width * 0.03),
              SvgPicture.asset(
                'assets/icons/instagram.svg',
                height: 28,
                width: 28,
              ),
            ],
          ),
          const SizedBox(height: 30),
          Text(
            'Explore',
            style: const AppTextStyles().h4SpaceMono,
          ),
          const SizedBox(height: 30),
          Text(
            'Marketplace',
            style: const AppTextStyles(color: AppColors.backGroundTertiary)
                .baseBodyWorkSans,
          ),
          const SizedBox(height: 15),
          Text(
            'Ranking',
            style: const AppTextStyles(color: AppColors.backGroundTertiary)
                .baseBodyWorkSans,
          ),
          const SizedBox(height: 15),
          Text(
            'Connect a Wallet',
            style: const AppTextStyles(color: AppColors.backGroundTertiary)
                .baseBodyWorkSans,
          ),
          const SizedBox(height: 30),
          Text(
            'Contact Us',
            style: const AppTextStyles().h4SpaceMono,
          ),
          const SizedBox(height: 30),
          Text('Contact us for any inquiries or support.',
              style: const AppTextStyles(color: AppColors.backGroundTertiary)
                  .baseBodyWorkSans),
          const SizedBox(height: 30),
          // custom Textfield
          SizedBox(
              height: 60,
              width: width * 0.8,
              child: CustomTextField(
                borderRadius: 20,
                borderColor: AppColors.primaryText,
                borderWidth: 1,
                hintText: 'Enter your email',
                hintStyle:
                    const AppTextStyles(color: Colors.black).baseBodyWorkSans,
              )),
          const SizedBox(height: 15),
          CustomRoundedButton(
            radius: 20,
            onTap: () {},
            height: 60,
            width: width * 0.8,
            color: AppColors.primaryButton,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.send,
                  size: 15,
                  color: AppColors.primaryText,
                ),
                SizedBox(width: width * 0.003),
                Text('Send', style: const AppTextStyles().baseBodyWorkSans)
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Divider(
            color: AppColors.backGroundTertiary,
            thickness: 1,
            height: height * 0.01,
          ),
          const SizedBox(height: 15),
          Text(
            'Ⓒ 2025 Bidly. All rights reserved.',
            style: const AppTextStyles(color: AppColors.backGroundTertiary)
                .baseBodyWorkSans,
          ),
        ],
      ),
    );
  }
}
