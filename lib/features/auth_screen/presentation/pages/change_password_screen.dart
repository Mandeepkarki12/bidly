import 'package:bidly/core/responsive_tools/responsive_layout.dart';
import 'package:bidly/features/auth_screen/presentation/pages/change_password_page/desktop_change_password_screen.dart';
import 'package:bidly/features/auth_screen/presentation/pages/change_password_page/mobile_change_password_screen.dart';
import 'package:bidly/features/auth_screen/presentation/pages/change_password_page/tablet_change_password_screen.dart';
import 'package:flutter/widgets.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
        mobileBody: MobileChangePasswordScreen(),
        webBody: DesktopChangePasswordScreen(),
        tabletBody: TabletChangePasswordScreen());
  }
}
