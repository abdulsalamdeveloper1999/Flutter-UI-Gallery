import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../core/componenets/mybutton.dart';
import '../core/utils/app_colors.dart';
import '../core/utils/dimensions.dart';
import '../core/utils/routes.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: Padding(
          padding: EdgeInsets.only(
            left: Dimensions.width15,
            right: Dimensions.width15,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(height: Dimensions.height45),

              Text(
                'SUSHI MAN',
                style: GoogleFonts.dmSerifDisplay(
                  fontSize: Dimensions.font26 + 2,
                  color: AppColors.white,
                ),
              ),
              SizedBox(height: Dimensions.height45),
              //icon
              Center(
                child: Image.asset(
                  'assets/images/sushi.png',
                  height: Dimensions.height120 * 2,
                  width: Dimensions.height120 * 2,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: Dimensions.height45),
              Text(
                'THE TASTE OF JAPANESE FOOD',
                style: GoogleFonts.dmSerifDisplay(
                  fontSize: Dimensions.font26 * 1.5,
                  color: AppColors.white,
                ),
              ),
              SizedBox(height: Dimensions.height10),
              Text(
                'Feel the taste of the most popular Japense food from anywhere and anytime',
                style: GoogleFonts.dmSerifDisplay(
                  fontSize: Dimensions.font20,
                  color: AppColors.white,
                ),
              ),

              SizedBox(height: Dimensions.height30),
              MyButton(
                bgColor: AppColors.buttonColor,
                onTap: () {
                  Get.toNamed(AppRoutes.menuPage);
                },
                text: 'Get Started',
              ),
              SizedBox(height: Dimensions.height10),
            ],
          ),
        ),
      ),
    );
  }
}
