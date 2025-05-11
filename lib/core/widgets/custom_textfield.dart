import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final Widget? prefix;
  final Widget? suffix;
  final String hintText;
  final TextInputType keyboardType;
  final bool obscureText;
  final int? maxLines;
  final Color? cursorColor;
  final int? minLines;
  final TextAlignVertical textAlignVertical;
  final TextAlign textAlign;
  final TextStyle? hintStyle;
  final InputBorder? border;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final InputBorder? errorBorder;
  final InputBorder? focusedErrorBorder;
  final Color? borderColor;
  final double borderWidth;
  final Color? errorColor;
  final double borderRadius;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;
  final TextEditingController? controller;
  final String? initialValue;
  final bool autovalidateMode;
  final Color? fillColor;
  final bool? filled;

  const CustomTextField({
    this.cursorColor = Colors.black,
    super.key,
    this.prefix,
    this.filled = true,
    this.suffix,
    this.hintText = 'Enter text',
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.maxLines = 1,
    this.minLines = 1,
    this.textAlignVertical = TextAlignVertical.center,
    this.textAlign = TextAlign.start,
    this.hintStyle,
    this.border,
    this.enabledBorder,
    this.focusedBorder,
    this.errorBorder,
    this.focusedErrorBorder,
    this.borderColor = Colors.grey,
    this.borderWidth = 1,
    this.errorColor = Colors.red,
    this.borderRadius = 8,
    this.validator,
    this.onChanged,
    this.onSaved,
    this.controller,
    this.initialValue,
    this.autovalidateMode = false,
    this.fillColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      initialValue: initialValue,
      decoration: InputDecoration(
        prefixIcon: prefix,
        suffixIcon: suffix,
        fillColor: fillColor,
        filled: filled,
        border: border ??
            OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
              borderSide: BorderSide(
                color: borderColor ?? Colors.grey,
                width: borderWidth,
              ),
            ),
        enabledBorder: enabledBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
              borderSide: BorderSide(
                color: borderColor ?? Colors.grey,
                width: borderWidth,
              ),
            ),
        focusedBorder: focusedBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
              borderSide: BorderSide(
                color: borderColor ?? Colors.grey,
                width: borderWidth,
              ),
            ),
        errorBorder: errorBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
              borderSide: BorderSide(
                color: errorColor ?? Colors.red,
                width: borderWidth,
              ),
            ),
        focusedErrorBorder: focusedErrorBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
              borderSide: BorderSide(
                color: errorColor ?? Colors.red,
                width: borderWidth,
              ),
            ),
        hintText: hintText,
        hintStyle: hintStyle ??
            const TextStyle(
              color: Colors.grey,
              fontSize: 16,
            ),
      ),
      keyboardType: keyboardType,
      obscureText: obscureText,
      cursorColor: cursorColor,
      maxLines: maxLines,
      minLines: minLines,
      textAlignVertical: textAlignVertical,
      textAlign: textAlign,
      validator: validator,
      onChanged: onChanged,
      onSaved: onSaved,
      autovalidateMode: autovalidateMode
          ? AutovalidateMode.onUserInteraction
          : AutovalidateMode.disabled,
    );
  }
}
