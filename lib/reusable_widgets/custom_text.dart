import 'package:flutter/material.dart';

import '../coffe_ui/utils/colors.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
    this.align,
    this.size,
    this.overflow,
    this.weight,
    this.decoration,
    this.color = Colors.white,
    this.softWrap = true,
    this.fontFamily,
  });
  final String? fontFamily;
  final bool? softWrap;
  final TextDecoration? decoration;
  final Color? color;
  final FontWeight? weight;
  final String text;
  final TextOverflow? overflow;
  final double? size;
  final TextAlign? align;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      softWrap: softWrap,
      overflow: overflow,
      style: TextStyle(
        decoration: decoration,
        color: color,
        decorationColor: AppColors.kgreyColor,
        fontWeight: weight,
        fontSize: size,
        fontFamily: fontFamily,
      ),
    );
  }
}
