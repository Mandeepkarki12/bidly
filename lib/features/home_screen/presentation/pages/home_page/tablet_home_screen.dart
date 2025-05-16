import 'package:bidly/core/widgets/custom_appbar/custom_mobile_appbar.dart';
import 'package:flutter/material.dart';

class TabletHomeScreen extends StatelessWidget {
  const TabletHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomMobileAppBar(),
    );
  }
}
