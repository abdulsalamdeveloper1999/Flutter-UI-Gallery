import 'package:flutter/material.dart';

import '../../reusable_widgets/custom_text.dart';
import '../utils/colors.dart';
import '../utils/lists.dart';
import 'widgets/banner.dart';
import 'widgets/best_choice.dart';
import 'widgets/bottom_navigation.dart';
import 'widgets/categories.dart';
import 'widgets/header.dart';

class CoffeHomeView extends StatelessWidget {
  const CoffeHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: const BottomNavigtationWidget(),
        backgroundColor: AppColors.kprimaryColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeaderWidget(),
            const CategoryRow(),
            choiceRow(
                leftText: 'Best Choice', rightText: 'See all', bottom: 40.0),
            bestChoice(size),
            choiceRow(
              leftText: 'Offers',
              rightText: 'See more',
              top: 40.0,
              bottom: 20.0,
            ),
            const BannerWidget()
          ],
        ),
      ),
    );
  }

  Widget bestChoice(Size size) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: AppLists.data.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 1.5,
          crossAxisCount: 2,
          mainAxisSpacing: size.height * 0.08,
          crossAxisSpacing: size.height * 0.03,
        ),
        itemBuilder: (BuildContext context, int index) {
          return BestChoiceWidget(
            image: AppLists.data[index]['image'],
            name: AppLists.data[index]['name'],
          );
        },
      ),
    );
  }

  Widget choiceRow({leftText, rightText, top = 0.0, bottom = 0.0}) {
    return Padding(
      padding: EdgeInsets.only(bottom: bottom, left: 20, right: 20, top: top),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(
            text: leftText,
            size: 16,
            weight: FontWeight.bold,
          ),
          CustomText(
            text: rightText,
            size: 14,
            color: AppColors.kbrown2,
            weight: FontWeight.w600,
          ),
        ],
      ),
    );
  }
}
