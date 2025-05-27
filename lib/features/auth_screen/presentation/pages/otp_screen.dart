import 'package:bidly/core/responsive_tools/responsive_layout.dart';

import 'package:bidly/features/auth_screen/presentation/pages/otp_page/desktop_otp_screen.dart';
import 'package:bidly/features/auth_screen/presentation/pages/otp_page/mobile_otp_screen.dart';
import 'package:flutter/material.dart';
class OtpScreen extends StatelessWidget {
  final String email;
  
  
  const OtpScreen({
    required this.email,
    super.key,
   
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveLayout(
        mobileBody: MobileOtpScreen(email: email,),
        webBody: DesktopOtpScreen(),
        tabletBody: DesktopOtpScreen(),
      ),
    );
  }
}
