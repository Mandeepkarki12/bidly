import 'package:bidly/core/widgets/custom_appbar/custom_mobile_appbar.dart';
import 'package:flutter/material.dart';

class MobileHomeScreen extends StatelessWidget {
  const MobileHomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomMobileAppBar(),
    );
  }
}
