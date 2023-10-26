import 'package:flutter/material.dart';

import '../../../reusable_widgets/custom.dart';
import '../../utils/colors.dart';
import '../../utils/lists.dart';

class CategoryRow extends StatefulWidget {
  const CategoryRow({super.key});

  @override
  State<CategoryRow> createState() => _CategoryRowState();
}

class _CategoryRowState extends State<CategoryRow> {
  Duration duration = const Duration(milliseconds: 300);

  int selectedIndex = 0;
  double height = 0.0;
  double txtSize = 0.0;

  Color color = Colors.white;

  double dotSize(index) {
    height = selectedIndex == index ? 5 : 2.5;
    return height;
  }

  double textSize(index) {
    txtSize = selectedIndex == index ? 14 : 12;
    return txtSize;
  }

  Color textColor(index) {
    color =
        selectedIndex == index ? AppColors.kwhiteColor : AppColors.kgreyColor;
    return color;
  }

  Color dotColor(index) {
    color = selectedIndex == index ? AppColors.kwhiteColor : Colors.transparent;
    return color;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Space(
        height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ...List.generate(
              AppLists.categories.length,
              (index) => GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: Column(
                  children: [
                    AnimatedDefaultTextStyle(
                      style: TextStyle(
                        fontSize: textSize(index),
                        color: textColor(index),
                      ),
                      duration: duration,
                      child: Text(
                        AppLists.categories[index],
                      ),
                    ),
                    const Space(height: 10),
                    AnimatedContainer(
                      height: dotSize(index),
                      width: dotSize(index),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: dotColor(index),
                      ),
                      duration: duration,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
