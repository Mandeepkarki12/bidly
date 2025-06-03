import 'package:bidly/core/routes/route_names.dart';
import 'package:bidly/core/theme/app_color.dart';
import 'package:bidly/core/theme/text_styles.dart';
import 'package:bidly/core/widgets/custom_appbar/custom_mobile_appbar.dart';
import 'package:bidly/core/widgets/custom_footer/custom_mobile_footer.dart';
import 'package:bidly/core/widgets/custom_rounded_button.dart';
import 'package:bidly/core/widgets/custom_snackbar.dart';
import 'package:bidly/core/widgets/custom_textfield.dart';
import 'package:bidly/features/auth_screen/presentation/bloc/auth_screen_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MobileLoginScreen extends StatefulWidget {
  const MobileLoginScreen({super.key});

  @override
  State<MobileLoginScreen> createState() => _MobileLoginScreenState();
}

class _MobileLoginScreenState extends State<MobileLoginScreen> {
  String email = '';
  String password = '';
  final _formKey = GlobalKey<FormState>();
  void submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      debugPrint('Email: $email');
      debugPrint('Password: $password');

      context.read<AuthScreenBloc>().add(
            AuthScreenLoginEvent(
              email: email,
              password: password,
            ),
          );
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
                showCustomSnackBar(
                  context,
                  message: state.message,
                  type: SnackBarType.error,
                );
              }
              if (state is AuthScreenSucess) {
                showCustomSnackBar(
                  context,
                  message: 'Login Successful for ${state.userId}',
                  type: SnackBarType.success,
                );
                Navigator.pushNamedAndRemoveUntil(
                    context, RouteNames.homeScreen, (route) => false);
              }
            },
            child: Form(
              key: _formKey,
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
                        onSaved: (value) {
                          email = value ?? '';
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          final emailRegex = RegExp(
                              r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
                          if (!emailRegex.hasMatch(value)) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                        hintStyle: const AppTextStyles(color: Colors.black)
                            .baseBodyWorkSans,
                      )),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                      width: double.infinity,
                      height: 85,
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
                        onSaved: (value) {
                          password = value ?? '';
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
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
                  BlocBuilder<AuthScreenBloc, AuthScreenState>(
                    builder: (context, state1) {
                      return CustomRoundedButton(
                          onTap: () {
                            submitForm();
                          },
                          height: 60,
                          width: double.infinity,
                          color: AppColors.primaryButton,
                          child: state1 is AuthScreenLoading
                              ? const CupertinoActivityIndicator(
                                  color: Colors.white,
                                  radius: 15,
                                )
                              : Center(
                                  child: Text('Login',
                                      style: const AppTextStyles()
                                          .baseBodyWorkSans)));
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Doesn\'t have an account ? ',
                          style: const AppTextStyles().baseBodyWorkSans),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacementNamed(
                              context, RouteNames.signupScreen);
                        },
                        child: Text('SignUp',
                            style: const AppTextStyles(
                                    color: AppColors.primaryButton)
                                .baseBodyWorkSans
                                .copyWith(
                                    decoration: TextDecoration.underline,
                                    decorationColor: AppColors.primaryButton)),
                      ),
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
        ),
      ),
    );
  }
}
