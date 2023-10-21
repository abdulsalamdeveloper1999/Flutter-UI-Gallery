import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomButtom extends StatelessWidget {
  const CustomButtom({
    super.key,
    this.radius,
    this.color,
    this.shadow,
    required this.text,
    required this.onTap,
  });
  final Function()? onTap;
  final double? radius;
  final Color? color;
  final BoxShadow? shadow;

  final String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius!),
          boxShadow: [shadow!],
          color: color,
        ),
        child: CustomText(text: text),
      ),
    );
  }
}
