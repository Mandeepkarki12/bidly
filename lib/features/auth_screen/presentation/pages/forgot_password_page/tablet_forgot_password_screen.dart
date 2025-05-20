import 'package:bidly/core/routes/route_names.dart';
import 'package:bidly/core/theme/app_color.dart';
import 'package:bidly/core/theme/text_styles.dart';
import 'package:bidly/core/widgets/custom_appbar/custom_mobile_appbar.dart';
import 'package:bidly/core/widgets/custom_footer/custom_tablet_footer.dart';
import 'package:bidly/core/widgets/custom_rounded_button.dart';
import 'package:bidly/core/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class TabletForgotPasswordScreen extends StatelessWidget {
  const TabletForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: const CustomMobileAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  height: 615,
                  width: width * 0.4,
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
                    Text('Forgot Password',
                        style: const AppTextStyles().h3WorkSans),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                        'Please enter your email address below, \nwe will send you a link to reset your password.',
                        textAlign: TextAlign.start,
                        style: const AppTextStyles()
                            .bodyText
                            .copyWith(fontSize: 16)),
                    const SizedBox(
                      height: 40,
                    ),
                    SizedBox(
                        width: 400,
                        height: 55,
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
                      height: 40,
                    ),
                    CustomRoundedButton(
                        onTap: () {
                          Navigator.pushNamed(
                              context, RouteNames.otpScreen);
                        },
                        height: 55,
                        width: 400,
                        color: AppColors.primaryButton,
                        child: Center(
                            child: Text('Send Otp',
                                style:
                                    const AppTextStyles().baseBodyWorkSans))),
                  ],
                )
              ],
            ),
            const CustomTabletFooter()
          ],
        ),
      ),
    );
  }
}
