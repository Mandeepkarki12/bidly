import 'package:bidly/core/theme/app_color.dart';
import 'package:flutter/material.dart';

class CustomDropdown<T> extends StatelessWidget {
  final List<DropdownMenuItem<T>> items;
  final T? value;
  final void Function(T?)? onChanged;
  final Widget? prefix;
  final String hintText;
  final Color? fillColor;
  final Color? borderColor;
  final double borderRadius;
  final double borderWidth;
  final TextStyle? hintStyle;
  final EdgeInsetsGeometry? contentPadding;
  final Color? dropdownColor;

  const CustomDropdown({
    super.key,
    required this.items,
    required this.value,
    required this.onChanged,
    this.prefix,
    this.hintText = 'Select',
    this.fillColor = Colors.white,
    this.borderColor = Colors.grey,
    this.borderRadius = 8,
    this.borderWidth = 1,
    this.hintStyle,
    this.contentPadding =
        const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
    this.dropdownColor,
  });

  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      decoration: InputDecoration(
        prefixIcon: prefix,
        filled: true,
        fillColor: fillColor,
        contentPadding: contentPadding,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide:
              BorderSide(color: borderColor ?? Colors.grey, width: borderWidth),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide:
              BorderSide(color: borderColor ?? Colors.grey, width: borderWidth),
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<T>(
          value: value,
          dropdownColor: dropdownColor ?? Colors.white,
          items: items,
          isExpanded: true,
          hint: Text(
            hintText,
            style: hintStyle ??
                const TextStyle(
                    color: AppColors.backGroundPrimary, fontSize: 16),
          ),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
