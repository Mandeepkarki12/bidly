import 'package:bidly/core/routes/route_names.dart';
import 'package:bidly/core/theme/app_color.dart';
import 'package:bidly/core/theme/text_styles.dart';
import 'package:bidly/core/widgets/custom_appbar/custom_mobile_appbar.dart';
import 'package:bidly/core/widgets/custom_footer/custom_tablet_footer.dart';
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

class TabletSignUpScreen extends StatefulWidget {
  const TabletSignUpScreen({super.key});

  @override
  State<TabletSignUpScreen> createState() => _TabletSignUpScreenState();
}

class _TabletSignUpScreenState extends State<TabletSignUpScreen> {
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
        showCustomSnackBar(
          context,
          message: 'Passwords do not match',
          type: SnackBarType.error,
        );
        return;
      }

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
    final width = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => PasswordMaskBloc(),
      child: Scaffold(
        appBar: CustomMobileAppBar(
          onMenuTap: () {
            // Handle menu tap if needed
          },
        ),
        body: BlocListener<AuthScreenBloc, AuthScreenState>(
          listener: (context, state) {
            if (state is AuthScreenFailure) {
              showCustomSnackBar(
                context,
                message: state.message,
                type: SnackBarType.error,
              );
            } else if (state is AuthScreenSucess) {
              userId = state.userId;
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

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => MobileOtpScreen(
                    email: email,
                    type: OtpType.signup,
                  ),
                ),
              );
            }
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: width * 0.5,
                      height: 820,
                      child: Image.asset(
                        'assets/images/login_signup_image.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: width * 0.03),
                    Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Create an Account',
                            style: const AppTextStyles().h3WorkSans,
                          ),
                          const SizedBox(height: 20),
                          Text(
                            'Welcome! enter your details and start\n creating, collecting and selling Products.',
                            style: const AppTextStyles()
                                .bodyText
                                .copyWith(fontSize: 16),
                          ),
                          const SizedBox(height: 40),
                          SizedBox(
                            height: 85,
                            width: 350,
                            child: CustomTextField(
                              prefix: const Icon(
                                Icons.person_2_outlined,
                                color: AppColors.secondaryText,
                              ),
                              borderRadius: 20,
                              borderColor: AppColors.primaryText,
                              borderWidth: 1,
                              onSaved: (value) => username = value ?? '',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your username';
                                }
                                if (value.length < 3) {
                                  return 'Username must be at least 3 characters';
                                }
                                return null;
                              },
                              hintText: 'Username',
                              hintStyle:
                                  const AppTextStyles(color: Colors.black)
                                      .baseBodyWorkSans,
                            ),
                          ),
                          const SizedBox(height: 15),
                          SizedBox(
                            height: 85,
                            width: 350,
                            child: CustomTextField(
                              prefix: const Icon(
                                Icons.email_outlined,
                                color: AppColors.secondaryText,
                              ),
                              borderRadius: 20,
                              borderColor: AppColors.primaryText,
                              borderWidth: 1,
                              onSaved: (value) => email = value ?? '',
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
                              hintText: 'Email Address',
                              hintStyle:
                                  const AppTextStyles(color: Colors.black)
                                      .baseBodyWorkSans,
                            ),
                          ),
                          const SizedBox(height: 10),
                          BlocBuilder<PasswordMaskBloc, PasswordMaskState>(
                            builder: (context, state) {
                              final isVisible = state is PasswordMaskVisible
                                  ? state.isVisible
                                  : false;
                              return SizedBox(
                                height: 85,
                                width: 350,
                                child: CustomTextField(
                                  obscureText: !isVisible,
                                  suffix: GestureDetector(
                                    onTap: () {
                                      context.read<PasswordMaskBloc>().add(
                                          PasswordMaskToggle(
                                              isVisible: !isVisible));
                                    },
                                    child: Icon(
                                      isVisible
                                          ? Icons.visibility_off_outlined
                                          : Icons.visibility,
                                      color: AppColors.secondaryText,
                                    ),
                                  ),
                                  prefix: const Icon(
                                    Icons.lock,
                                    color: AppColors.secondaryText,
                                  ),
                                  borderRadius: 20,
                                  borderColor: AppColors.primaryText,
                                  borderWidth: 1,
                                  onSaved: (value) => password = value ?? '',
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your password';
                                    }
                                    if (value.length < 6) {
                                      return 'Password must be at least 6 characters';
                                    }
                                    return null;
                                  },
                                  hintText: 'Password',
                                  hintStyle:
                                      const AppTextStyles(color: Colors.black)
                                          .baseBodyWorkSans,
                                ),
                              );
                            },
                          ),
                          const SizedBox(height: 10),
                          BlocBuilder<PasswordMaskBloc, PasswordMaskState>(
                            builder: (context, state) {
                              final isVisible = state is PasswordMaskVisible
                                  ? state.isVisible
                                  : false;
                              return SizedBox(
                                height: 85,
                                width: 350,
                                child: CustomTextField(
                                  obscureText: !isVisible,
                                  suffix: GestureDetector(
                                    onTap: () {
                                      context.read<PasswordMaskBloc>().add(
                                          PasswordMaskToggle(
                                              isVisible: !isVisible));
                                    },
                                    child: Icon(
                                      isVisible
                                          ? Icons.visibility_off_outlined
                                          : Icons.visibility,
                                      color: AppColors.secondaryText,
                                    ),
                                  ),
                                  prefix: const Icon(
                                    Icons.lock,
                                    color: AppColors.secondaryText,
                                  ),
                                  borderRadius: 20,
                                  borderColor: AppColors.primaryText,
                                  borderWidth: 1,
                                  onSaved: (value) =>
                                      confirmPassword = value ?? '',
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please confirm your password';
                                    }
                                    if (value.length < 6) {
                                      return 'Password must be at least 6 characters';
                                    }
                                    return null;
                                  },
                                  hintText: 'Confirm Password',
                                  hintStyle:
                                      const AppTextStyles(color: Colors.black)
                                          .baseBodyWorkSans,
                                ),
                              );
                            },
                          ),
                          const SizedBox(height: 30),
                          BlocBuilder<AuthScreenBloc, AuthScreenState>(
                            builder: (context, state) {
                              return CustomRoundedButton(
                                onTap: _submitForm,
                                height: 70,
                                width: 350,
                                radius: 20,
                                color: AppColors.primaryButton,
                                child: state is! AuthScreenLoading
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
                          const SizedBox(height: 30),
                          Padding(
                            padding: const EdgeInsets.only(left: 50),
                            child: Row(
                              children: [
                                Text(
                                  'Already have an account?',
                                  style: const AppTextStyles().baseBodyWorkSans,
                                ),
                                const SizedBox(width: 10),
                                InkWell(
                                  onTap: () => Navigator.pushReplacementNamed(
                                      context, RouteNames.loginScreen),
                                  child: Text(
                                    'Login',
                                    style: const AppTextStyles()
                                        .baseBodyWorkSans
                                        .copyWith(
                                            color: AppColors.primaryButton),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const CustomTabletFooter(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
