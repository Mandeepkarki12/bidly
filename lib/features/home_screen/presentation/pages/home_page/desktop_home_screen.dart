import 'package:bidly/core/widgets/custom_appbar/custom_web_appbar.dart';
import 'package:flutter/material.dart';

class DesktopHomeScreen extends StatelessWidget {
  const DesktopHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomWebAppBar(),
    );
  }
}
