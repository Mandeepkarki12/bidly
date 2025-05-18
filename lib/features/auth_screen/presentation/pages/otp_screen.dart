import 'package:bidly/core/responsive_tools/responsive_layout.dart';
import 'package:bidly/features/auth_screen/presentation/pages/login_page/desktop_login_screen.dart';
import 'package:bidly/features/auth_screen/presentation/pages/login_page/tablet_login_screen.dart';
import 'package:bidly/features/auth_screen/presentation/pages/otp_page/mobile_otp_screen.dart';
import 'package:flutter/material.dart';

class otpScreen extends StatelessWidget {
  const otpScreen({super.key});

  @override
  Widget build(BuildContext context) {
   return const Scaffold(
      body: ResponsiveLayout(
          mobileBody: mobile_otp_screen(),
           webBody: DesktopLoginScreen(),
          tabletBody: TabletLoginScreen()

         
    ),);
  }
}