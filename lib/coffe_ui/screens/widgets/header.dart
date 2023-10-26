import 'package:flutter/material.dart';

import '../../../reusable_widgets/custom.dart';
import '../../../reusable_widgets/custom_text.dart';
import '../../utils/colors.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 20,
        bottom: 25,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(2),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.kgreyColor,
                ),
                child: const CircleAvatar(
                  backgroundColor: AppColors.kbrown2,
                  backgroundImage: AssetImage('assets/dp.jpg'),
                ),
              ),
              const Space(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: 'Good morning',
                    size: 16,
                    color: AppColors.kwhiteColor.withOpacity(0.8),
                    weight: FontWeight.bold,
                  ),
                  const Space(height: 2),
                  const Row(
                    children: [
                      Icon(
                        Icons.place,
                        size: 16,
                        color: AppColors.kgreyColor,
                      ),
                      Space(width: 5),
                      CustomText(
                        text: 'Lviv ,Ukrain',
                        size: 14,
                        color: AppColors.kgreyColor,
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
          const Stack(
            children: [
              Positioned(
                right: 0,
                child: CircleAvatar(
                  backgroundColor: AppColors.kbrown2,
                  radius: 5,
                ),
              ),
              Icon(
                Icons.shopping_bag_outlined,
                color: AppColors.kgreyColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
