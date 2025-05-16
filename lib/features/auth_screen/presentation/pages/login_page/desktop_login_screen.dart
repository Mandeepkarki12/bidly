import 'package:bidly/core/routes/route_names.dart';
import 'package:bidly/core/theme/app_color.dart';
import 'package:bidly/core/theme/text_styles.dart';
import 'package:bidly/core/widgets/custom_appbar/custom_web_appbar.dart';
import 'package:bidly/core/widgets/custom_footer/custom_web_footer.dart';
import 'package:bidly/core/widgets/custom_rounded_button.dart';
import 'package:bidly/core/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
//this is change
class DesktopLoginScreen extends StatelessWidget {
  const DesktopLoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: const CustomWebAppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: width * 0.5,
                    height: 691,
                    child: Image.asset(
                      'assets/images/login_signup_image.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: width * 0.03),
                  SizedBox(
                    width: 520,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Login', style: const AppTextStyles().h2WorkSans),
                        const SizedBox(
                          height: 30,
                        ),
                        Text('Please enter your credentials !!',
                            style: const AppTextStyles().bodyText),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                            width: 350,
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
                          height: 15,
                        ),
                        SizedBox(
                            width: 350,
                            height: 50,
                            child: CustomTextField(
                              suffix: const Icon(
                                Icons.remove_red_eye,
                                color: AppColors.secondaryText,
                                size: 23,
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
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, RouteNames.forgotPasswordScreen);
                              },
                              child: Text('Forgot Password ?',
                                  style:
                                      const AppTextStyles().baseBodyWorkSans),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        CustomRoundedButton(
                            onTap: () {},
                            height: 50,
                            width: 350,
                            color: AppColors.primaryButton,
                            child: Center(
                                child: Text('Login',
                                    style: const AppTextStyles()
                                        .baseBodyWorkSans))),
                        const SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 35),
                          child: Row(
                            children: [
                              Text('Doesn\'t have an account ? ',
                                  style:
                                      const AppTextStyles().baseBodyWorkSans),
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
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const CustomWebFooter()
            ],
          ),
        ));
  }
}
