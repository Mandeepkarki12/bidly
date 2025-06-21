import 'package:bidly/core/theme/app_color.dart';
import 'package:bidly/core/theme/text_styles.dart';
import 'package:bidly/core/widgets/custom_appbar/custom_web_appbar.dart';
import 'package:bidly/core/widgets/custom_footer/custom_web_footer.dart';
import 'package:bidly/core/widgets/custom_rounded_button.dart';
import 'package:bidly/core/widgets/custom_snackbar.dart';
import 'package:bidly/core/widgets/custom_textfield.dart';
import 'package:bidly/features/auth_screen/presentation/bloc/auth_screen_bloc.dart';
import 'package:bidly/features/auth_screen/presentation/pages/otp_page/desktop_otp_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DesktopForgotPasswordScreen extends StatefulWidget {
  const DesktopForgotPasswordScreen({super.key});

  @override
  State<DesktopForgotPasswordScreen> createState() =>
      _DesktopForgotPasswordScreenState();
}

class _DesktopForgotPasswordScreenState
    extends State<DesktopForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  String email = '';

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      context
          .read<AuthScreenBloc>()
          .add(AuthScreenResetPasswordEvent(email: email));
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: const CustomWebAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  height: 691,
                  width: width * 0.45,
                  child: Image.asset(
                    'assets/images/login_signup_image.png',
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 50),
                BlocListener<AuthScreenBloc, AuthScreenState>(
                  listener: (context, state) {
                    if (state is AuthScreenFailure) {
                      showCustomSnackBar(
                        context,
                        message: state.message,
                        type: SnackBarType.error,
                      );
                    }
                    if (state is AuthScreenSucess) {
                      showCustomSnackBar(
                        context,
                        message: state.userId,
                        type: SnackBarType.success,
                      );
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DesktopOtpScreen(
                            email: email,
                            type: OtpType.recovery,
                          ),
                        ),
                      );
                    }
                  },
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Forgot Password',
                          style: const AppTextStyles().h2WorkSans,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Please enter your email address below, \nwe will send you a link to reset your password.',
                          textAlign: TextAlign.start,
                          style: const AppTextStyles().bodyText,
                        ),
                        const SizedBox(height: 40),
                        SizedBox(
                          width: 450,
                          height: 85,
                          child: CustomTextField(
                            prefix: const Icon(
                              Icons.email_outlined,
                              color: AppColors.secondaryText,
                            ),
                            borderRadius: 20,
                            borderColor: AppColors.primaryText,
                            borderWidth: 1,
                            hintText: 'Email Address',
                            onSaved: (value) => email = value ?? '',
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email address';
                              }
                              if (!RegExp(
                                      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
                                  .hasMatch(value)) {
                                return 'Please enter a valid email address';
                              }
                              return null;
                            },
                            hintStyle: const AppTextStyles(color: Colors.black)
                                .baseBodyWorkSans,
                          ),
                        ),
                        const SizedBox(height: 30),
                        BlocBuilder<AuthScreenBloc, AuthScreenState>(
                          builder: (context, state) {
                            return CustomRoundedButton(
                              onTap: _submitForm,
                              height: 65,
                              width: 450,
                              color: AppColors.primaryButton,
                              child: state is AuthScreenLoading
                                  ? const CupertinoActivityIndicator(
                                      color: Colors.white,
                                      radius: 15,
                                    )
                                  : Center(
                                      child: Text(
                                        'Send OTP',
                                        style: const AppTextStyles()
                                            .baseBodyWorkSans
                                            .copyWith(color: Colors.white),
                                      ),
                                    ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const CustomWebFooter(),
          ],
        ),
      ),
    );
  }
}
