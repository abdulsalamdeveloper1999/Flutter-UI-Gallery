// ignore_for_file: public_member_api_docs, sort_constructors_first
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
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final InputBorder? border;
  final BoxConstraints? constraints;

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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        contentPadding: contentPadding,
        hintText: hintText,
        hintStyle: hintStyle,
        labelText: hintText,
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
