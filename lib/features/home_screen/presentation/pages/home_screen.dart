import 'package:bidly/core/responsive_tools/responsive_layout.dart';
import 'package:bidly/features/home_screen/presentation/pages/home_page/desktop_home_screen.dart';
import 'package:bidly/features/home_screen/presentation/pages/home_page/mobile_home_screen.dart';
import 'package:bidly/features/home_screen/presentation/pages/home_page/tablet_home_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ResponsiveLayout(
          mobileBody: MobileHomeScreen(),
          webBody: DesktopHomeScreen(),
          tabletBody: TabletHomeScreen()),
    );
  }
}
