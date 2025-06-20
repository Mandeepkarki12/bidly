import 'package:bidly/core/responsive_tools/responsive_layout.dart';
import 'package:bidly/features/profile_screen/presentation/pages/profile_page/desktop_profile_screen.dart';
import 'package:bidly/features/profile_screen/presentation/pages/profile_page/mobile_profile_screen.dart';
import 'package:bidly/features/profile_screen/presentation/pages/profile_page/tablet_profile_screen.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ResponsiveLayout(
        mobileBody: MobileProfileScreen(),
        tabletBody: TabletProfileScreen(),
        webBody: DesktopProfileScreen(),
      ),
    );
  }
}
