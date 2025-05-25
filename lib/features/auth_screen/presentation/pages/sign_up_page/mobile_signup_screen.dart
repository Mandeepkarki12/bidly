import 'package:bidly/core/routes/route_names.dart';
import 'package:bidly/core/theme/app_color.dart';
import 'package:bidly/core/theme/text_styles.dart';
import 'package:bidly/core/widgets/custom_appbar/custom_mobile_appbar.dart';
import 'package:bidly/core/widgets/custom_footer/custom_mobile_footer.dart';
import 'package:bidly/core/widgets/custom_rounded_button.dart';
import 'package:bidly/core/widgets/custom_textfield.dart';
import 'package:bidly/features/auth_screen/presentation/bloc/auth_screen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

      // Print to debug console
      debugPrint('Username: $username');
      debugPrint('Email: $email');
      debugPrint('Password: $password');
      debugPrint('Confirm Password: $confirmPassword');

      // You can now proceed with actual signup logic here
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
    return Scaffold(
      appBar: const CustomMobileAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: BlocListener<AuthScreenBloc, AuthScreenState>(
            listener: (context, state) {
              if (state is AuthScreenLoading) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Signing up...')),
                );
              } else if (state is AuthScreenFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.message)),
                );
              } else if (state is AuthScreenSucess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Signup successful')),
                );
                Navigator.pushReplacementNamed(context, RouteNames.homeScreen);
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
                const SizedBox(height: 20),
                Text(
                  'Welcome! enter your details and start\n creating, collecting and selling Products.',
                  textAlign: TextAlign.center,
                  style: const AppTextStyles().baseBodyWorkSans,
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                    height: 60,
                    width: double.infinity,
                    child: CustomTextField(
                      prefix: const Icon(
                        Icons.person_2_outlined,
                        color: AppColors.secondaryText,
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
                  height: 15,
                ),
                SizedBox(
                    height: 60,
                    width: double.infinity,
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
                    height: 60,
                    width: double.infinity,
                    child: CustomTextField(
                      suffix: const Icon(
                        Icons.remove_red_eye_outlined,
                        color: AppColors.secondaryText,
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
                    )),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                    height: 60,
                    width: double.infinity,
                    child: CustomTextField(
                      suffix: const Icon(
                        Icons.remove_red_eye_outlined,
                        color: AppColors.secondaryText,
                      ),
                      prefix: const Icon(
                        Icons.lock,
                        color: AppColors.secondaryText,
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
                    )),
                const SizedBox(
                  height: 30,
                ),
                CustomRoundedButton(
                  onTap: () => {
                    _submitForm(),
                  },
                  height: 50,
                  width: double.infinity,
                  radius: 20,
                  color: AppColors.primaryButton,
                  child: Center(
                    child: Text(
                      'Create Account',
                      style: const AppTextStyles()
                          .baseBodyWorkSans
                          .copyWith(color: Colors.white),
                    ),
                  ),
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
                        Navigator.pushNamed(context, RouteNames.loginScreen);
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
    );
  }
}
