import 'package:bidly/core/responsive_tools/responsive_layout.dart';

import 'package:bidly/features/auth_screen/presentation/pages/otp_page/desktop_otp_screen.dart';
import 'package:bidly/features/auth_screen/presentation/pages/otp_page/mobile_otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
class OtpScreen extends StatelessWidget {
  final String email;
  final OtpType type ;
  
  
  const OtpScreen({
    required this.email,
    required this.type,
    super.key,
   
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveLayout(
        mobileBody: MobileOtpScreen(email: email, type: type),
        webBody: DesktopOtpScreen(),
        tabletBody: DesktopOtpScreen(),
      ),
    );
  }
}
