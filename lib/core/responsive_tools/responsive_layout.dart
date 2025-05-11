import 'package:bidly/core/responsive_tools/dimensions.dart';
import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileBody;
  final Widget tabletBody;
  final Widget webBody;

  const ResponsiveLayout(
      {super.key,
      required this.mobileBody,
      required this.webBody,
      required this.tabletBody});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < Dimensions.mobileWidth) {
          return mobileBody;
        } else if (constraints.maxWidth < Dimensions.tabletWidth) {
          return tabletBody;
        } else {
          return webBody;
        }
      },
    );
  }
}
