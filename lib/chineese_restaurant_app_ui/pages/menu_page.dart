import 'package:flutter/material.dart';
import 'package:flutter_ui_portfolio/chineese_restaurant_app_ui/core/componenets/mybutton.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../core/componenets/my_text.dart';
import '../core/controllers/shop_controller.dart';
import '../core/utils/app_colors.dart';
import '../core/utils/dimensions.dart';
import '../core/widgets/food_tile.dart';
import 'cart_page.dart';
import 'food_details.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  void navigateDetails(index) {
    Get.to(
      () => FoodDetailsPage(
        food: Get.find<ShopController>().foodMenu[index],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var globalPadding = EdgeInsets.all(Dimensions.height10);
    var textFieldBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: const BorderSide(color: Colors.white),
    );
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Icon(
            Icons.menu,
            size: Dimensions.iconSize24,
          ),
          centerTitle: true,
          title: Text(
            'Tokyo',
            style: TextStyle(
              color: Colors.grey[900],
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Get.to(() => const CartPage());
              },
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.grey[800],
                size: Dimensions.iconSize24,
              ),
            ),
          ],
        ),
        backgroundColor: AppColors.grey,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            HeaderWidget(globalPadding: globalPadding),
            SizedBox(height: Dimensions.height15),
            SearchWidget(textFieldBorder: textFieldBorder),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text(
                'Food Name',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Colors.grey[800],
                  fontSize: Dimensions.font16 + 2,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: Dimensions.width20),
              height: Dimensions.height120 * 2.2,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: Get.find<ShopController>().foodMenu.length,
                itemBuilder: (BuildContext context, int index) {
                  return FoodTile(
                    onTap: () => navigateDetails(index),
                    food: Get.find<ShopController>().foodMenu[index],
                  );
                },
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: Dimensions.width20,
                vertical: Dimensions.height15,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: Dimensions.width20,
                vertical: Dimensions.height20,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/sushi.png',
                        height: Dimensions.height45,
                        width: Dimensions.height45,
                      ),
                      SizedBox(width: Dimensions.width15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Salmon Eggs',
                            style: GoogleFonts.dmSerifDisplay(
                                fontSize: Dimensions.font20 - 2),
                          ),
                          MyText(text: '\$21.0', size: Dimensions.font16),
                        ],
                      )
                    ],
                  ),
                  Icon(
                    Icons.favorite_outline_rounded,
                    size: Dimensions.iconSize24,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
    required this.textFieldBorder,
  });

  final OutlineInputBorder textFieldBorder;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: Dimensions.width20,
        right: Dimensions.width20,
      ),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: 'Search',
          enabledBorder: textFieldBorder,
          focusedBorder: textFieldBorder,
        ),
      ),
    );
  }
}

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    super.key,
    required this.globalPadding,
  });

  final EdgeInsets globalPadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: globalPadding,
      margin: EdgeInsets.only(
        left: Dimensions.width20,
        right: Dimensions.width20,
      ),
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.circular(Dimensions.radius20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                'Get 32% Promo',
                style: GoogleFonts.dmSerifDisplay(
                  color: AppColors.white,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: Dimensions.height10),
              SizedBox(
                width: Dimensions.width20 * 8,
                child: MyButton(
                  bgColor: Colors.white.withOpacity(0.055),
                  onTap: () {},
                  text: 'Redeem',
                ),
              )
            ],
          ),
          Image.asset(
            'assets/images/sushi (1).png',
            height: Dimensions.height10 * 10,
          )
        ],
      ),
    );
  }
}
