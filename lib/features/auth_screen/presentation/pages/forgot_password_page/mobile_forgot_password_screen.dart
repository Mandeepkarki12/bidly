import 'package:bidly/core/theme/app_color.dart';
import 'package:bidly/core/theme/text_styles.dart';
import 'package:bidly/core/widgets/custom_appbar/custom_mobile_appbar.dart';
import 'package:bidly/core/widgets/custom_footer/custom_mobile_footer.dart';
import 'package:bidly/core/widgets/custom_rounded_button.dart';
import 'package:bidly/core/widgets/custom_snackbar.dart';
import 'package:bidly/core/widgets/custom_textfield.dart';
import 'package:bidly/features/auth_screen/presentation/bloc/auth_screen_bloc.dart';
import 'package:bidly/features/auth_screen/presentation/pages/otp_page/mobile_otp_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MobileForgotPasswordScreen extends StatefulWidget {
  const MobileForgotPasswordScreen({super.key});

  @override
  State<MobileForgotPasswordScreen> createState() =>
      _MobileForgotPasswordScreenState();
}

class _MobileForgotPasswordScreenState
    extends State<MobileForgotPasswordScreen> {
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
    return Scaffold(
      appBar: const CustomMobileAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: BlocListener<AuthScreenBloc, AuthScreenState>(
            listener: (context, state) {
              if (state is AuthScreenFailure) {
                showCustomSnackBar(context,
                    message: state.message, type: SnackBarType.error);
              }
              if (state is AuthScreenSucess) {
                showCustomSnackBar(context,
                    message: state.userId, type: SnackBarType.success);
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return MobileOtpScreen(
                    type: OtpType.recovery,
                    email: email,
                  );
                }));
              }
            },
            child: Form(
              key: _formKey,
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
                    style:
                        const AppTextStyles().bodyText.copyWith(fontSize: 16)),
                const SizedBox(
                  height: 40,
                ),
                SizedBox(
                    width: double.infinity,
                    height: 95,
                    child: CustomTextField(
                      prefix: const Icon(
                        Icons.email_outlined,
                        color: AppColors.secondaryText,
                      ),
                      borderRadius: 20,
                      borderColor: AppColors.primaryText,
                      borderWidth: 1,
                      hintText: 'Email Address',
                      onChanged: (value) {
                        email = value;
                      },
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
                    )),
                const SizedBox(
                  height: 20,
                ),
                BlocBuilder<AuthScreenBloc, AuthScreenState>(
                  builder: (context, state2) {
                    return CustomRoundedButton(
                        onTap: () {
                          _submitForm();
                        },
                        height: 60,
                        width: double.infinity,
                        color: AppColors.primaryButton,
                        child: state2 is AuthScreenLoading
                            ? const CupertinoActivityIndicator(
                                color: Colors.white,
                                radius: 10,
                              )
                            : Center(
                                child: Text('Send Otp',
                                    style: const AppTextStyles()
                                        .baseBodyWorkSans)));
                  },
                ),
                const SizedBox(
                  height: 40,
                ),
                const CustomMobileFooter()
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
