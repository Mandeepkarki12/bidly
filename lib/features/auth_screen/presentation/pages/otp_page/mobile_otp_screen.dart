import 'package:bidly/core/theme/app_color.dart';
import 'package:bidly/core/theme/text_styles.dart';
import 'package:bidly/core/widgets/custom_rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class MobileOtpScreen extends StatelessWidget {
  const MobileOtpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xFF9A6AFF);
    const Color backgroundColor = Color(0xFF1E1E1E);
    const Color inputFieldColor = Color(0xFF2A2A2A);
    const Color textColor = Colors.white;

    final defaultPinTheme = PinTheme(
      width: 60,
      height: 60,
      textStyle: const TextStyle(
        fontSize: 24,
        color: textColor,
        fontWeight: FontWeight.bold,
      ),
      decoration: BoxDecoration(
        color: inputFieldColor,
        borderRadius: BorderRadius.circular(12),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: BoxDecoration(
        color: inputFieldColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: primaryColor),
      ),
    );

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              reverse: true,
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 24,
                      right: 24,
                      bottom: MediaQuery.of(context).viewInsets.bottom + 20,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const SizedBox(height: 24),
                              Image.asset(
                                'assets/images/otp.png',
                                height: 150,
                              ),
                              const SizedBox(height: 24),
                              Text(
                                'OTP Verification',
                                style: const AppTextStyles(
                                        color: AppColors.primaryButton)
                                    .h4WorkSans,
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Enter the code we sent to: +977 9845536627',
                                textAlign: TextAlign.center,
                                style: const AppTextStyles().baseBodySpaceMono,
                              ),
                              const SizedBox(height: 30),

                              // Pinput OTP field here
                              Pinput(
                                length: 4,
                                defaultPinTheme: defaultPinTheme,
                                focusedPinTheme: focusedPinTheme,
                                keyboardType: TextInputType.number,
                                showCursor: true,
                                onCompleted: (pin) {
                                  // Handle OTP completion
                                },
                              ),

                              const SizedBox(height: 20),
                              const Text(
                                'Resend code in 60 seconds.',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            const SizedBox(height: 30),

                            // 🔁 Submit button
                            CustomRoundedButton(
                              onTap: () {
                                // Submit action
                              },
                              height: 60,
                              radius: 20,
                              width: double.infinity,
                              color: primaryColor,
                              child: Center(
                                child: Text(
                                  'Submit',
                                  style: const AppTextStyles().bodyText,
                                ),
                              ),
                            ),

                            const SizedBox(height: 12),

                            // 🔁 Resend Code button
                            CustomRoundedButton(
                              onTap: () {
                                // Resend action
                              },
                              height: 60,
                              width: double.infinity,
                              shouldFill: false,
                              color: AppColors.backGroundSecondary,
                              radius: 20,
                              child: Center(
                                child: Text(
                                  'Resend code',
                                  style: const AppTextStyles(
                                    color: AppColors.primaryText,
                                  ).bodyText,
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
