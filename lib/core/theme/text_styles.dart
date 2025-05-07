import 'package:bidly/core/theme/app_color.dart';
import 'package:flutter/material.dart';

class AppTextStyles {
  final Color color;

  const AppTextStyles({this.color = AppColors.primaryText});

  TextStyle get buttonTextStyle => const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        fontFamily: 'WorkSans',
      ).copyWith(color: color);

  TextStyle get h1SpaceMono => const TextStyle(
        fontSize: 67,
        fontWeight: FontWeight.w700,
        fontFamily: 'SpaceMono',
      ).copyWith(color: color);

  TextStyle get h2SpaceMono => const TextStyle(
        fontSize: 51,
        fontWeight: FontWeight.w700,
        fontFamily: 'SpaceMono',
      ).copyWith(color: color);

  TextStyle get h3SpaceMono => const TextStyle(
        fontSize: 38,
        fontWeight: FontWeight.w700,
        fontFamily: 'SpaceMono',
      ).copyWith(color: color);

  TextStyle get h4SpaceMono => const TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w700,
        fontFamily: 'SpaceMono',
      ).copyWith(color: color);

  TextStyle get h5SpaceMono => const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w700,
        fontFamily: 'SpaceMono',
      ).copyWith(color: color);

  TextStyle get baseBodySpaceMono => const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        fontFamily: 'SpaceMono',
      ).copyWith(color: color);

  TextStyle get captionSpaceMono => const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        fontFamily: 'SpaceMono',
      ).copyWith(color: color);

  TextStyle get h1WorkSans => const TextStyle(
        fontSize: 67,
        fontWeight: FontWeight.w600,
        fontFamily: 'WorkSans',
      ).copyWith(color: color);

  TextStyle get h2WorkSans => const TextStyle(
        fontSize: 51,
        fontWeight: FontWeight.w600,
        fontFamily: 'WorkSans',
      ).copyWith(color: color);

  TextStyle get h3WorkSans => const TextStyle(
        fontSize: 38,
        fontWeight: FontWeight.w600,
        fontFamily: 'WorkSans',
      ).copyWith(color: color);

  TextStyle get h4WorkSans => const TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w600,
        fontFamily: 'WorkSans',
      ).copyWith(color: color);

  TextStyle get h5WorkSans => const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        fontFamily: 'WorkSans',
      ).copyWith(color: color);

  TextStyle get baseBodyWorkSans => const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        fontFamily: 'WorkSans',
      ).copyWith(color: color);

  TextStyle get captionWorkSans => const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        fontFamily: 'WorkSans',
      ).copyWith(color: color);

  TextStyle get bodyText => const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w400,
        fontFamily: 'WorkSans',
      ).copyWith(color: color);
}
