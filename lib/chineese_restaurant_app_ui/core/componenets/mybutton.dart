import 'package:flutter/material.dart';

import '../utils/dimensions.dart';

class MyButton extends StatelessWidget {
  Function()? onTap;
  String text;
  Color bgColor;
  MyButton({
    super.key,
    required this.onTap,
    required this.text,
    this.bgColor = const Color.fromARGB(225, 138, 60, 55),
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: Dimensions.width15 - 10),
            const Icon(
              Icons.arrow_forward,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
