import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class BottomNavigtationWidget extends StatefulWidget {
  const BottomNavigtationWidget({
    super.key,
  });

  @override
  State<BottomNavigtationWidget> createState() =>
      _BottomNavigtationWidgetState();
}

class _BottomNavigtationWidgetState extends State<BottomNavigtationWidget> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 70,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.kbottomColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(100),
                topRight: Radius.circular(100),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: -20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                  3,
                  (index) => GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: index == 1 ? 35 : 25,
                            backgroundColor: selectedIndex == index
                                ? AppColors.kselected
                                : AppColors.kcardColor,
                            child: index == 1
                                ? Image.asset(
                                    'assets/search.png',
                                    height: 40,
                                    color: selectedIndex == index
                                        ? AppColors.kbrown2
                                        : AppColors.kwhiteColor,
                                  )
                                : Icon(
                                    index == 0
                                        ? Icons.home_outlined
                                        : index == 1
                                            ? Icons.search
                                            : Icons.favorite_outline,
                                    color: selectedIndex == index
                                        ? AppColors.kbrown2
                                        : AppColors.kwhiteColor,
                                    size: 30,
                                  ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
