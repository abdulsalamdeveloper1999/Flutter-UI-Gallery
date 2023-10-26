// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../utils/dimensions.dart';

// ignore: must_be_immutable
class MyButton extends StatelessWidget {
  Function()? onTap;
  String text;
  Color bgColor;
  final double radius;
  final double? height;
  final double? width;
  final double? textSize;
  final bool showIcon;

  MyButton({
    Key? key,
    required this.onTap,
    required this.text,
    this.bgColor = const Color.fromARGB(225, 138, 60, 55),
    this.radius = 40.0,
    this.height = 55.0,
    this.width = double.infinity,
    this.textSize = 16.0,
    this.showIcon = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        // padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(radius),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: textSize,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: Dimensions.width15 - 10),
            showIcon
                ? const Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
