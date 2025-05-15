import 'package:bidly/core/routes/route_names.dart';
import 'package:bidly/core/theme/app_color.dart';
import 'package:bidly/core/theme/text_styles.dart';
import 'package:bidly/core/widgets/custom_appbar/custom_mobile_appbar.dart';
import 'package:bidly/core/widgets/custom_footer/custom_mobile_footer.dart';
import 'package:bidly/core/widgets/custom_rounded_button.dart';
import 'package:bidly/core/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class MobileSignUpScreen extends StatelessWidget {
  const MobileSignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomMobileAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(children: [
            SizedBox(
              height: 232,
              width: double.infinity,
              child: Image.asset(
                'assets/images/login_signup_image.png',
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 30),
            Text('Create an Account', style: const AppTextStyles().h3WorkSans),
            const SizedBox(height: 20),
            Text(
              'Welcome! enter your details and start\n creating, collecting and selling Products.',
              style: const AppTextStyles().baseBodyWorkSans,
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
                height: 60,
                width: double.infinity,
                child: CustomTextField(
                  prefix: const Icon(
                    Icons.person_2_outlined,
                    color: AppColors.secondaryText,
                  ),
                  borderRadius: 20,
                  borderColor: AppColors.primaryText,
                  borderWidth: 1,
                  hintText: 'Username',
                  hintStyle:
                      const AppTextStyles(color: Colors.black).baseBodyWorkSans,
                )),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
                height: 60,
                width: double.infinity,
                child: CustomTextField(
                  prefix: const Icon(
                    Icons.email_outlined,
                    color: AppColors.secondaryText,
                  ),
                  borderRadius: 20,
                  borderColor: AppColors.primaryText,
                  borderWidth: 1,
                  hintText: 'Email Address',
                  hintStyle:
                      const AppTextStyles(color: Colors.black).baseBodyWorkSans,
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
                  hintText: 'Password',
                  hintStyle:
                      const AppTextStyles(color: Colors.black).baseBodyWorkSans,
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
                  hintStyle:
                      const AppTextStyles(color: Colors.black).baseBodyWorkSans,
                )),
            const SizedBox(
              height: 30,
            ),
            CustomRoundedButton(
              onTap: () => {},
              height: 50,
              width: double.infinity,
              radius: 20,
              color: AppColors.primaryButton,
              child: Center(
                child: Text(
                  'Create Account',
                  style: const AppTextStyles()
                      .baseBodyWorkSans
                      .copyWith(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account?',
                  style: const AppTextStyles().baseBodyWorkSans,
                ),
                const SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, RouteNames.loginScreen);
                  },
                  child: Text(
                    'Login',
                    style: const AppTextStyles()
                        .baseBodyWorkSans
                        .copyWith(color: AppColors.primaryButton),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            const CustomMobileFooter()
          ]),
        ),
      ),
    );
  }
}
