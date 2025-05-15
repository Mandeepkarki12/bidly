import 'package:bidly/core/routes/route_names.dart';
import 'package:bidly/core/theme/app_color.dart';
import 'package:bidly/core/theme/text_styles.dart';
import 'package:bidly/core/widgets/custom_appbar/custom_mobile_appbar.dart';
import 'package:bidly/core/widgets/custom_footer/custom_mobile_footer.dart';
import 'package:bidly/core/widgets/custom_rounded_button.dart';
import 'package:bidly/core/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class MobileLoginScreen extends StatelessWidget {
  const MobileLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomMobileAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(
                height: 232,
                width: double.infinity,
                child: Image.asset(
                  'assets/images/login_signup_image.png',
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 30),
              Text('Login', style: const AppTextStyles().h3WorkSans),
              const SizedBox(height: 20),
              Text('Please enter your credentials !!',
                  style: const AppTextStyles().baseBodyWorkSans),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: CustomTextField(
                    prefix: const Icon(
                      Icons.email_outlined,
                      color: AppColors.secondaryText,
                    ),
                    borderRadius: 20,
                    borderColor: AppColors.primaryText,
                    borderWidth: 1,
                    hintText: 'Email Address',
                    hintStyle: const AppTextStyles(color: Colors.black)
                        .baseBodyWorkSans,
                  )),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: CustomTextField(
                    suffix: const Icon(
                      Icons.remove_red_eye,
                      color: AppColors.secondaryText,
                      size: 25,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                          context, RouteNames.forgotPasswordScreen);
                    },
                    child: Text(
                      'Forgot Password ?',
                      style: const AppTextStyles()
                          .baseBodyWorkSans
                          .copyWith(color: AppColors.primaryText),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              CustomRoundedButton(
                  onTap: () {},
                  height: 50,
                  width: double.infinity,
                  color: AppColors.primaryButton,
                  child: Center(
                      child: Text('Login',
                          style: const AppTextStyles().baseBodyWorkSans))),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Doesn\'t have an account ? ',
                      style: const AppTextStyles().baseBodyWorkSans),
                  Text('SignUp',
                      style: const AppTextStyles(color: AppColors.primaryButton)
                          .baseBodyWorkSans
                          .copyWith(
                              decoration: TextDecoration.underline,
                              decorationColor: AppColors.primaryButton)),
                ],
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
