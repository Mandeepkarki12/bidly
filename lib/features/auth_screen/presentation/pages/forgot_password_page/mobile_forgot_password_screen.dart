import 'package:bidly/core/routes/route_names.dart';
import 'package:bidly/core/theme/app_color.dart';
import 'package:bidly/core/theme/text_styles.dart';
import 'package:bidly/core/widgets/custom_appbar/custom_mobile_appbar.dart';
import 'package:bidly/core/widgets/custom_footer/custom_mobile_footer.dart';
import 'package:bidly/core/widgets/custom_rounded_button.dart';
import 'package:bidly/core/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class MobileForgotPasswordScreen extends StatelessWidget {
  const MobileForgotPasswordScreen({super.key});
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
            const SizedBox(
              height: 30,
            ),
            Text(
                'Please enter your email address below, \nwe will send you a link to reset your password.',
                textAlign: TextAlign.center,
                style: const AppTextStyles().bodyText.copyWith(fontSize: 16)),
            const SizedBox(
              height: 40,
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
                  hintStyle:
                      const AppTextStyles(color: Colors.black).baseBodyWorkSans,
                )),
            const SizedBox(
              height: 30,
            ),
            CustomRoundedButton(
                onTap: () {
                  Navigator.pushNamed(context, RouteNames.changePasswordScreen);
                },
                height: 60,
                width: double.infinity,
                color: AppColors.primaryButton,
                child: Center(
                    child: Text('Send Otp',
                        style: const AppTextStyles().baseBodyWorkSans))),
            const SizedBox(
              height: 40,
            ),
            const CustomMobileFooter()
          ]),
        ),
      ),
    );
  }
}
