import 'package:flutter/material.dart';

import '../../../reusable_widgets/custom_text.dart';
import '../../utils/colors.dart';

class BestChoiceWidget extends StatelessWidget {
  const BestChoiceWidget({
    super.key,
    required this.image,
    required this.name,
  });
  final String image;
  final String name;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      // width: 150,
      child: Stack(
        fit: StackFit.passthrough,
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 125,
            width: 150,
            decoration: BoxDecoration(
              color: AppColors.kcardColor,
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              height: 42,
              width: 30,
              decoration: BoxDecoration(
                color: AppColors.kprimaryColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: -12,
            child: Container(
              height: 40,
              width: 50,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: AppColors.kprimaryColor,
                    blurRadius: 0,
                    spreadRadius: 2,
                    offset: const Offset(-2, 0),
                  ),
                ],
                color: AppColors.kbrown2,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.arrow_forward,
                color: AppColors.kwhiteColor,
              ),
            ),
          ),
          Positioned(
              bottom: 10,
              left: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: name,
                    size: 14,
                    weight: FontWeight.w500,
                  ),
                  const CustomText(
                    size: 14,
                    weight: FontWeight.w500,
                    text: '80-20',
                  ),
                  const CustomText(
                    size: 14,
                    weight: FontWeight.w500,
                    text: '20 USD',
                  ),
                ],
              )),
          Positioned(
            top: -35,
            child: PhysicalShape(
              color: Colors.transparent,
              shadowColor: Colors.black.withOpacity(0.3),
              elevation: 2,
              clipper: const ShapeBorderClipper(shape: CircleBorder()),
              child: Image.asset(
                image,
                height: 65,
                width: 65,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
