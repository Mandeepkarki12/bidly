import 'package:flutter/material.dart';

class CustomRoundedButton extends StatelessWidget {
  const CustomRoundedButton({
    super.key,
    required this.color,
    required this.child,
    this.onTap,
    this.shouldFill = true,
    this.gradient,
    this.radius = 100,
    this.width,
    this.height,
  });
  final Widget child;
  final Color color;
  final LinearGradient? gradient;
  final bool shouldFill;
  final Function()? onTap;
  final double radius;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: shouldFill ? color : Colors.white,
      borderRadius: BorderRadius.circular(radius),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(radius),
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            gradient: gradient,
            borderRadius: BorderRadius.circular(radius),
            border: Border.all(
              color: color
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}
