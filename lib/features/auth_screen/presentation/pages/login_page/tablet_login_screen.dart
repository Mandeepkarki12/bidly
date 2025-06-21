import 'package:bidly/core/routes/route_names.dart';
import 'package:bidly/core/theme/app_color.dart';
import 'package:bidly/core/theme/text_styles.dart';
import 'package:bidly/core/widgets/custom_appbar/custom_mobile_appbar.dart';
import 'package:bidly/core/widgets/custom_footer/custom_tablet_footer.dart';
import 'package:bidly/core/widgets/custom_rounded_button.dart';
import 'package:bidly/core/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class TabletLoginScreen extends StatelessWidget {
  const TabletLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar:  CustomMobileAppBar(onMenuTap: () {
        
      },),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Login Form
            Row(
              children: [
                // image
                SizedBox(
                  width: width * 0.4,
                  height: 650,
                  child: Image.asset(
                    'assets/images/login_signup_image.png',
                    fit: BoxFit.cover,
                  ),
                ),
                // login form
                Container(
                  padding: const EdgeInsets.all(30),
                  height: 650,
                  width: 450,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Login', style: const AppTextStyles().h2WorkSans),
                        const SizedBox(
                          height: 20,
                        ),
                        Text('Please enter your credentials !!',
                            style: const AppTextStyles().bodyText),
                        const SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                            width: 380,
                            height: 50,
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
                                  const AppTextStyles(color: Colors.black)
                                      .baseBodyWorkSans,
                            )),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                            width: 380,
                            height: 50,
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
                              hintStyle:
                                  const AppTextStyles(color: Colors.black)
                                      .baseBodyWorkSans,
                            )),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: Row(
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
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomRoundedButton(
                            onTap: () {},
                            height: 50,
                            width: 380,
                            color: AppColors.primaryButton,
                            child: Center(
                                child: Text('Login',
                                    style: const AppTextStyles()
                                        .baseBodyWorkSans))),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Doesn\'t have an account ? ',
                                style: const AppTextStyles().baseBodyWorkSans),
                            Text('SignUp',
                                style: const AppTextStyles(
                                        color: AppColors.primaryButton)
                                    .baseBodyWorkSans
                                    .copyWith(
                                        decoration: TextDecoration.underline,
                                        decorationColor:
                                            AppColors.primaryButton)),
                          ],
                        ),
                      ]),
                )
              ],
            ),
            const CustomTabletFooter(),
          ],
        ),
      ),
    );
  }
}
