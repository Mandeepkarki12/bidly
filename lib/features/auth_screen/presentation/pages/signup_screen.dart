import 'package:bidly/core/responsive_tools/responsive_layout.dart';
import 'package:bidly/features/auth_screen/presentation/pages/sign_up_page/desktop_signup_screen.dart';
import 'package:bidly/features/auth_screen/presentation/pages/sign_up_page/mobile_signup_screen.dart';
import 'package:bidly/features/auth_screen/presentation/pages/sign_up_page/tablet_signup_screen.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ResponsiveLayout(
          mobileBody: MobileSignUpScreen(),
          webBody: DesktopSignUpScreen(),
          tabletBody: TabletSignUpScreen()),
    );
  }
}
