import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  final String text;
  final FontWeight? weight;
  final Color? color;
  final TextOverflow? overflow;
  final double? size;
  final String? fontFamily;
  final double? height;
  const MyText({
    this.fontFamily,
    super.key,
    this.height,
    this.overflow,
    required this.text,
    this.weight,
    this.color,
    this.size = 12.0,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      style: TextStyle(
        height: height,
        color: color,
        fontWeight: weight,
        fontSize: size,
        fontFamily: fontFamily,
      ),
    );
  }
}
