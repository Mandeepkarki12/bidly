import 'package:bidly/core/routes/route_names.dart';
import 'package:bidly/core/theme/app_color.dart';
import 'package:bidly/core/theme/text_styles.dart';
import 'package:bidly/core/widgets/custom_appbar/custom_mobile_appbar.dart';
import 'package:bidly/core/widgets/custom_footer/custom_tablet_footer.dart';
import 'package:bidly/core/widgets/custom_rounded_button.dart';
import 'package:bidly/core/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class TabletSignUpScreen extends StatelessWidget {
  const TabletSignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar:  CustomMobileAppBar(
          onMenuTap: () {
            // Handle menu tap if needed
          },
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: width * 0.5,
                    height: 615,
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
                      Text('Create an Account',
                          style: const AppTextStyles().h3WorkSans),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Welcome! enter your details and start\n creating, collecting and selling Products.',
                        style: const AppTextStyles()
                            .bodyText
                            .copyWith(fontSize: 16),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      SizedBox(
                          height: 50,
                          width: 350,
                          child: CustomTextField(
                            prefix: const Icon(
                              Icons.person_2_outlined,
                              color: AppColors.secondaryText,
                            ),
                            borderRadius: 20,
                            borderColor: AppColors.primaryText,
                            borderWidth: 1,
                            hintText: 'Username',
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
                      Padding(
                        padding: const EdgeInsets.only(left: 50),
                        child: Row(
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
                                Navigator.pushNamed(
                                    context, RouteNames.loginScreen);
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
                      ),
                    ],
                  )
                ],
              ),
              const CustomTabletFooter()
            ],
          ),
        ));
  }
}
