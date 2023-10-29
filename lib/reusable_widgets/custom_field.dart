import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final TextStyle? hintStyle;
  final EdgeInsetsGeometry? contentPadding;
  final Widget? prefixIcon;
  final Widget? suffix;
  final bool? filled;
  final Color? fillColor;
  final Color? cursor;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final InputBorder? border;
  final BoxConstraints? constraints;
  final String? labelText;
  final TextStyle? style;
  final TextInputType? keyboardType;

  const CustomTextField({
    Key? key,
    this.controller,
    this.hintText,
    this.hintStyle,
    this.contentPadding,
    this.prefixIcon,
    this.suffix,
    this.filled,
    this.fillColor,
    this.focusedBorder,
    this.enabledBorder,
    this.border,
    this.constraints,
    this.labelText,
    this.style,
    this.cursor,
    this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      style: style,
      cursorColor: cursor,
      controller: controller,
      decoration: InputDecoration(
        contentPadding: contentPadding,
        hintText: hintText,
        hintStyle: hintStyle,
        labelText: labelText,
        labelStyle: hintStyle,
        border: border,
        focusedBorder: focusedBorder,
        filled: filled,
        fillColor: fillColor,
        enabledBorder: enabledBorder,
        constraints: constraints,
      ),
    );
  }
}
