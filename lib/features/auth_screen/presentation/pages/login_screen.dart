import 'package:bidly/core/responsive_tools/responsive_layout.dart';

import 'package:bidly/features/auth_screen/presentation/pages/login_page/desktop_login_screen.dart';
import 'package:bidly/features/auth_screen/presentation/pages/login_page/mobile_login_screen.dart';
import 'package:bidly/features/auth_screen/presentation/pages/login_page/tablet_login_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ResponsiveLayout(
          mobileBody: MobileLoginScreen(),
          webBody: DesktopLoginScreen(),
          tabletBody: TabletLoginScreen()),
    );
  }
}
