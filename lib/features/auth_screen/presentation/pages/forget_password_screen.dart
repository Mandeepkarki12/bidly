import 'package:bidly/core/responsive_tools/responsive_layout.dart';
import 'package:bidly/features/auth_screen/presentation/pages/forgot_password_page/desktop_forgot_password_screen.dart';
import 'package:bidly/features/auth_screen/presentation/pages/forgot_password_page/mobile_forgot_password_screen.dart';
import 'package:bidly/features/auth_screen/presentation/pages/forgot_password_page/tablet_forgot_password_screen.dart';
import 'package:flutter/widgets.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
        mobileBody: MobileForgotPasswordScreen(),
        webBody: DesktopForgotPasswordScreen(),
        tabletBody: TabletForgotPasswordScreen());
  }
}
