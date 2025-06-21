import 'package:bidly/core/routes/route_names.dart';
import 'package:bidly/core/theme/app_color.dart';
import 'package:bidly/core/theme/text_styles.dart';
import 'package:bidly/core/widgets/custom_appbar/custom_web_appbar.dart';
import 'package:bidly/core/widgets/custom_footer/custom_web_footer.dart';
import 'package:bidly/core/widgets/custom_rounded_button.dart';
import 'package:bidly/core/widgets/custom_snackbar.dart';
import 'package:bidly/core/widgets/custom_textfield.dart';
import 'package:bidly/features/auth_screen/presentation/bloc/auth_screen_bloc.dart';
import 'package:bidly/features/auth_screen/presentation/bloc/passwordMask/password_mask_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DesktopChangePasswordScreen extends StatefulWidget {
  const DesktopChangePasswordScreen({super.key});

  @override
  State<DesktopChangePasswordScreen> createState() =>
      _DesktopChangePasswordScreenState();
}

class _DesktopChangePasswordScreenState
    extends State<DesktopChangePasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  String newPassword = '';
  String confirmPassword = '';

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      if (newPassword != confirmPassword) {
        showCustomSnackBar(context,
            message: 'Passwords do not match', type: SnackBarType.error);
        return;
      }

      context.read<AuthScreenBloc>().add(
            AuthScreenChangePasswordEvent(newPassword: newPassword),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return BlocProvider(
      create: (context) => PasswordMaskBloc(),
      child: Scaffold(
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
                        showCustomSnackBar(context,
                            message: state.message, type: SnackBarType.error);
                      }
                      if (state is AuthScreenSucess) {
                        showCustomSnackBar(context,
                            message: 'Password changed successfully',
                            type: SnackBarType.success);
                        Navigator.pushReplacementNamed(
                            context, RouteNames.loginScreen);
                      }
                    },
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Create a New Password',
                              style: const AppTextStyles().h2WorkSans),
                          const SizedBox(height: 20),
                          Text('Please enter and confirm your new password.',
                              style: const AppTextStyles().bodyText),
                          const SizedBox(height: 40),
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
                                  hintText: 'New Password',
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your new password';
                                    }
                                    if (value.length < 6) {
                                      return 'Password must be at least 6 characters';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) => newPassword = value ?? '',
                                  hintStyle:
                                      const AppTextStyles(color: Colors.black)
                                          .baseBodyWorkSans,
                                ),
                              );
                            },
                          ),
                          const SizedBox(height: 8),
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
                                  hintText: 'Confirm New Password',
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please confirm your new password';
                                    }
                                    if (value.length < 6) {
                                      return 'Password must be at least 6 characters';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) =>
                                      confirmPassword = value ?? '',
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
                                height: 65,
                                width: 350,
                                radius: 20,
                                color: AppColors.primaryButton,
                                child: state is AuthScreenLoading
                                    ? const Center(
                                        child: CupertinoActivityIndicator(
                                          color: Colors.white,
                                          radius: 15,
                                        ),
                                      )
                                    : Center(
                                        child: Text(
                                          'Change Password',
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
      ),
    );
  }
}
