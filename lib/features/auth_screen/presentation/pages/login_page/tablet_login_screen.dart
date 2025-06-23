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
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TabletLoginScreen extends StatefulWidget {
  const TabletLoginScreen({super.key});

  @override
  State<TabletLoginScreen> createState() => _TabletLoginScreenState();
}

class _TabletLoginScreenState extends State<TabletLoginScreen> {
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
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return BlocProvider(
      create: (context) => PasswordMaskBloc(),
      child: Scaffold(
        appBar: CustomMobileAppBar(
          onMenuTap: () {},
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Login Form
              Row(
                children: [
                  // Image
                  SizedBox(
                    width: width * 0.4,
                    height: 650,
                    child: Image.asset(
                      'assets/images/login_signup_image.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  // Login Form
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
                          message: 'Login Successful',
                          type: SnackBarType.success,
                        );
                        Navigator.pushNamedAndRemoveUntil(
                            context, RouteNames.homeScreen, (route) => false);
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.all(30),
                      height: 650,
                      width: 450,
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Login',
                                style: const AppTextStyles().h2WorkSans),
                            const SizedBox(height: 20),
                            Text('Please enter your credentials !!',
                                style: const AppTextStyles().bodyText),
                            const SizedBox(height: 30),
                            SizedBox(
                              width: 380,
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
                                    return 'Please enter your email';
                                  }
                                  final emailRegex = RegExp(
                                      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
                                  if (!emailRegex.hasMatch(value)) {
                                    return 'Please enter a valid email address';
                                  }
                                  return null;
                                },
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
                                  width: 380,
                                  height: 85,
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
                                        size: 25,
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
                                    onSaved: (value) => password = value ?? '',
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your password';
                                      }
                                      return null;
                                    },
                                    hintStyle:
                                        const AppTextStyles(color: Colors.black)
                                            .baseBodyWorkSans,
                                  ),
                                );
                              },
                            ),
                            const SizedBox(height: 20),
                            Padding(
                              padding: const EdgeInsets.only(right: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(context,
                                          RouteNames.forgotPasswordScreen);
                                    },
                                    child: Text(
                                      'Forgot Password ?',
                                      style: const AppTextStyles()
                                          .baseBodyWorkSans
                                          .copyWith(
                                              color: AppColors.primaryText),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                            BlocBuilder<AuthScreenBloc, AuthScreenState>(
                              builder: (context, state) {
                                return CustomRoundedButton(
                                  onTap: submitForm,
                                  height: 60,
                                  width: 380,
                                  color: AppColors.primaryButton,
                                  child: state is AuthScreenLoading
                                      ? const CupertinoActivityIndicator(
                                          color: Colors.white,
                                          radius: 15,
                                        )
                                      : Center(
                                          child: Text('Login',
                                              style: const AppTextStyles()
                                                  .baseBodyWorkSans
                                                  .copyWith(
                                                      color: Colors.white)),
                                        ),
                                );
                              },
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Doesn\'t have an account ? ',
                                    style:
                                        const AppTextStyles().baseBodyWorkSans),
                                InkWell(
                                  onTap: () {
                                    Navigator.pushReplacementNamed(
                                        context, RouteNames.signupScreen);
                                  },
                                  child: Text('SignUp',
                                      style: const AppTextStyles(
                                              color: AppColors.primaryButton)
                                          .baseBodyWorkSans
                                          .copyWith(
                                              decoration:
                                                  TextDecoration.underline,
                                              decorationColor:
                                                  AppColors.primaryButton)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const CustomTabletFooter(),
            ],
          ),
        ),
      ),
    );
  }
}
