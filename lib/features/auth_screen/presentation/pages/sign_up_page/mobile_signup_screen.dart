import 'package:bidly/core/routes/route_names.dart';
import 'package:bidly/core/theme/app_color.dart';
import 'package:bidly/core/theme/text_styles.dart';
import 'package:bidly/core/widgets/custom_appbar/custom_mobile_appbar.dart';
import 'package:bidly/core/widgets/custom_footer/custom_mobile_footer.dart';
import 'package:bidly/core/widgets/custom_rounded_button.dart';
import 'package:bidly/core/widgets/custom_snackbar.dart';
import 'package:bidly/core/widgets/custom_textfield.dart';
import 'package:bidly/features/auth_screen/presentation/bloc/auth_screen_bloc.dart';
import 'package:bidly/features/auth_screen/presentation/bloc/passwordMask/password_mask_bloc.dart';
import 'package:bidly/features/auth_screen/presentation/pages/otp_page/mobile_otp_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MobileSignUpScreen extends StatefulWidget {
  const MobileSignUpScreen({
    super.key,
  });

  @override
  State<MobileSignUpScreen> createState() => _MobileSignUpScreenState();
}

class _MobileSignUpScreenState extends State<MobileSignUpScreen> {
  String username = '';
  String email = '';
  String password = '';
  String confirmPassword = '';
  String userId = '';

  final _formKey = GlobalKey<FormState>();
  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      if (password != confirmPassword) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Passwords do not match')),
        );
        return;
      }

      debugPrint('Username: $username');
      debugPrint('Email: $email');
      debugPrint('Password: $password');
      debugPrint('Confirm Password: $confirmPassword');

      context.read<AuthScreenBloc>().add(
            AuthScreenSignupEvent(
              userName: username,
              email: email,
              password: password,
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PasswordMaskBloc(),
      child: Scaffold(
        appBar: CustomMobileAppBar(
          onMenuTap: () {
            // Handle menu tap if needed
          },
        ),
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
                } else if (state is AuthScreenSucess) {
                  userId = state.userId;
                  // saving the user information into database my sql
                  context.read<AuthScreenBloc>().add(AuthSaveTodbEvent(
                        userId: userId,
                        userName: username,
                        userEmail: email,
                      ));
                  showCustomSnackBar(
                    context,
                    message: 'Signup successful',
                    type: SnackBarType.success,
                  );

                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return MobileOtpScreen(email: email, type: OtpType.signup);
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
                  const SizedBox(height: 30),
                  Text('Create an Account',
                      style: const AppTextStyles().h4WorkSans),
                  const SizedBox(height: 15),
                  Text(
                    'Welcome! enter your details and start\n creating, collecting and selling Products.',
                    textAlign: TextAlign.center,
                    style: const AppTextStyles().baseBodyWorkSans,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                      height: 85,
                      width: double.infinity,
                      child: CustomTextField(
                        prefix: const Icon(
                          Icons.person_2_outlined,
                          color: AppColors.secondaryText,
                          size: 20,
                        ),
                        borderRadius: 20,
                        borderColor: AppColors.primaryText,
                        borderWidth: 1,
                        onSaved: (value) {
                          username = value ?? '';
                        },
                        hintText: 'Username',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your username';
                          }
                          if (value.length < 3) {
                            return 'Username must be at least 3 characters';
                          }
                          return null;
                        },
                        hintStyle: const AppTextStyles(color: Colors.black)
                            .baseBodyWorkSans,
                      )),
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                      height: 85,
                      width: double.infinity,
                      child: CustomTextField(
                        prefix: const Icon(
                          Icons.email_outlined,
                          color: AppColors.secondaryText,
                          size: 20,
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
                    height: 5,
                  ),
                  BlocBuilder<PasswordMaskBloc, PasswordMaskState>(
                    builder: (context, state) {
                      final isVisible = state is PasswordMaskVisible
                          ? state.isVisible
                          : false;
                      return SizedBox(
                          height: 85,
                          width: double.infinity,
                          child: CustomTextField(
                            obscureText: !isVisible,
                            suffix: GestureDetector(
                              onTap: () {
                                context.read<PasswordMaskBloc>().add(
                                      PasswordMaskToggle(isVisible: !isVisible),
                                    );
                              },
                              child: Icon(
                                isVisible
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility,
                                color: AppColors.secondaryText,
                                size: 20,
                              ),
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
                              if (value.length < 6) {
                                return 'Password must be at least 6 characters';
                              }
                              return null;
                            },
                            hintStyle: const AppTextStyles(color: Colors.black)
                                .baseBodyWorkSans,
                          ));
                    },
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  BlocBuilder<PasswordMaskBloc, PasswordMaskState>(
                    builder: (context, state) {
                      final isVisible = state is PasswordMaskVisible
                          ? state.isVisible
                          : false;
                      return SizedBox(
                          height: 85,
                          width: double.infinity,
                          child: CustomTextField(
                            obscureText: !isVisible,
                            suffix: GestureDetector(
                              onTap: () {
                                context.read<PasswordMaskBloc>().add(
                                      PasswordMaskToggle(isVisible: !isVisible),
                                    );
                              },
                              child: Icon(
                                isVisible
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility,
                                color: AppColors.secondaryText,
                                size: 20,
                              ),
                            ),
                            prefix: const Icon(
                              Icons.lock,
                              color: AppColors.secondaryText,
                              size: 20,
                            ),
                            borderRadius: 20,
                            borderColor: AppColors.primaryText,
                            borderWidth: 1,
                            hintText: 'Confirm Password',
                            onSaved: (value) {
                              confirmPassword = value ?? '';
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please confirm your password';
                              }
                              if (value.length < 6) {
                                return 'Password must be at least 6 characters';
                              }
                              return null;
                            },
                            hintStyle: const AppTextStyles(color: Colors.black)
                                .baseBodyWorkSans,
                          ));
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  BlocBuilder<AuthScreenBloc, AuthScreenState>(
                    builder: (context, state2) {
                      return CustomRoundedButton(
                        onTap: () => {
                          _submitForm(),
                        },
                        height: 60,
                        width: double.infinity,
                        radius: 20,
                        color: AppColors.primaryButton,
                        child: state2 is! AuthScreenLoading
                            ? Center(
                                child: Text(
                                  'Create Account',
                                  style: const AppTextStyles()
                                      .baseBodyWorkSans
                                      .copyWith(color: Colors.white),
                                ),
                              )
                            : const Center(
                                child: CupertinoActivityIndicator(
                                  color: Colors.white,
                                  radius: 15,
                                ),
                              ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                          Navigator.pushReplacementNamed(
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
                  const SizedBox(
                    height: 30,
                  ),
                  const CustomMobileFooter()
                ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
