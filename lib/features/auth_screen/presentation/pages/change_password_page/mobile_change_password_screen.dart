import 'package:bidly/core/theme/app_color.dart';
import 'package:bidly/core/theme/text_styles.dart';
import 'package:bidly/core/widgets/custom_appbar/custom_mobile_appbar.dart';
import 'package:bidly/core/widgets/custom_footer/custom_mobile_footer.dart';
import 'package:bidly/core/widgets/custom_rounded_button.dart';
import 'package:bidly/core/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class MobileChangePasswordScreen extends StatelessWidget {
  const MobileChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomMobileAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                  height: 232,
                  width: double.infinity,
                  child: Image.asset(
                    'assets/images/login_signup_image.png',
                    fit: BoxFit.cover,
                  )),
              const SizedBox(
                height: 30,
              ),
              Text('Create a new password',
                  style:
                      const AppTextStyles().h3WorkSans.copyWith(fontSize: 28)),
              const SizedBox(
                height: 20,
              ),
              Text('Please enter and confirm your new password.',
                  textAlign: TextAlign.center,
                  style: const AppTextStyles().bodyText.copyWith(fontSize: 16)),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                  height: 60,
                  width: double.infinity,
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
                  height: 60,
                  width: double.infinity,
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
                height: 60,
                width: double.infinity,
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
              ),
              const SizedBox(
                height: 30,
              ),
              const CustomMobileFooter()
            ],
          ),
        ),
      ),
    );
  }
}
