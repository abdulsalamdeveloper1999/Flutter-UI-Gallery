import 'package:flutter/material.dart';

import '../../../reusable_widgets/custom.dart';
import '../../../reusable_widgets/custom_text.dart';
import '../../utils/colors.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              height: size.height * 0.06,
              width: double.maxFinite,
              decoration: const BoxDecoration(
                color: AppColors.kcardColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              height: size.height * 0.05,
              width: size.width * 0.85,
              decoration: const BoxDecoration(
                color: AppColors.kcardColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
            ),
          ],
        ),
        Positioned(
            left: 20,
            top: 0,
            bottom: 0,
            child: Row(
              children: [
                Image.asset(
                  'assets/cookie.png',
                  height: 50,
                ),
                const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: 'Chocolate',
                      weight: FontWeight.bold,
                      size: 14.0,
                    ),
                    CustomText(
                      text: 'Cookie',
                      weight: FontWeight.bold,
                      size: 14.0,
                    ),
                  ],
                ),
                Space(width: size.width * 0.2),
                const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: '20 USD',
                      decoration: TextDecoration.lineThrough,
                      color: AppColors.kgreyColor,
                    ),
                    CustomText(
                      text: '12 Usd',
                      weight: FontWeight.w500,
                    ),
                  ],
                )
              ],
            )),
        Positioned(
          right: 20,
          bottom: 0,
          child: Container(
            height: 40,
            width: 50,
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: AppColors.kprimaryColor,
                  blurRadius: 0,
                  spreadRadius: 2,
                  offset: Offset(-2, 0),
                ),
              ],
              color: AppColors.kbrown2,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.arrow_forward,
              color: AppColors.kwhiteColor,
            ),
          ),
        ),
      ],
    );
  }
}
