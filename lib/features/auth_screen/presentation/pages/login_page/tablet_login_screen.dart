import 'package:bidly/core/widgets/custom_appbar/custom_mobile_appbar.dart';
import 'package:bidly/core/widgets/custom_footer/custom_tablet_footer.dart';
import 'package:flutter/material.dart';

class TabletLoginScreen extends StatelessWidget {
  const TabletLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomMobileAppBar(),
      body: CustomTabletFooter(),
    );
  }
}
