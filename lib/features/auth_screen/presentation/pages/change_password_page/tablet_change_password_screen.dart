import 'package:bidly/core/theme/app_color.dart';
import 'package:bidly/core/theme/text_styles.dart';
import 'package:bidly/core/widgets/custom_appbar/custom_mobile_appbar.dart';
import 'package:bidly/core/widgets/custom_footer/custom_tablet_footer.dart';
import 'package:bidly/core/widgets/custom_rounded_button.dart';
import 'package:bidly/core/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class TabletChangePasswordScreen extends StatelessWidget {
  const TabletChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar:  CustomMobileAppBar(onMenuTap: () {
        
      },),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  height: 615,
                  width: width * 0.45,
                  child: Image.asset(
                    'assets/images/login_signup_image.png',
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: width * 0.03,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Create a  New Password',
                        style: const AppTextStyles()
                            .h3WorkSans
                            .copyWith(fontSize: 28)),
                    const SizedBox(
                      height: 20,
                    ),
                    Text('Please enter and confirm your new password.',
                        style: const AppTextStyles()
                            .bodyText
                            .copyWith(fontSize: 16)),
                    const SizedBox(
                      height: 40,
                    ),
                    SizedBox(
                        height: 50,
                        width: 350,
                        child: CustomTextField(
                          suffix: const Icon(
                            Icons.remove_red_eye_outlined,
                            color: AppColors.secondaryText,
                          ),
                          prefix: const Icon(
                            Icons.lock,
                            color: AppColors.secondaryText,
                          ),
                          borderRadius: 20,
                          borderColor: AppColors.primaryText,
                          borderWidth: 1,
                          hintText: 'Password',
                          hintStyle: const AppTextStyles(color: Colors.black)
                              .baseBodyWorkSans,
                        )),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                        height: 50,
                        width: 350,
                        child: CustomTextField(
                          suffix: const Icon(
                            Icons.remove_red_eye_outlined,
                            color: AppColors.secondaryText,
                          ),
                          prefix: const Icon(
                            Icons.lock,
                            color: AppColors.secondaryText,
                          ),
                          borderRadius: 20,
                          borderColor: AppColors.primaryText,
                          borderWidth: 1,
                          hintText: 'Confirm Password',
                          hintStyle: const AppTextStyles(color: Colors.black)
                              .baseBodyWorkSans,
                        )),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomRoundedButton(
                      onTap: () => {},
                      height: 50,
                      width: 350,
                      radius: 20,
                      color: AppColors.primaryButton,
                      child: Center(
                        child: Text(
                          'Change Password',
                          style: const AppTextStyles()
                              .baseBodyWorkSans
                              .copyWith(color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
            const CustomTabletFooter(),
          ],
        ),
      ),
    );
  }
}
