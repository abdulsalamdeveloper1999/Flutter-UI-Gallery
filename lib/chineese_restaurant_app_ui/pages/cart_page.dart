import 'package:flutter/material.dart';
import 'package:flutter_ui_portfolio/chineese_restaurant_app_ui/core/utils/app_colors.dart';
import 'package:get/get.dart';

import '../core/componenets/my_text.dart';
import '../core/componenets/mybutton.dart';
import '../core/controllers/shop_controller.dart';
import '../core/utils/dimensions.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Container(
          margin: EdgeInsets.only(
            bottom: Dimensions.height15,
            right: Dimensions.width15,
            left: Dimensions.width15,
          ),
          child: MyButton(
            onTap: () {},
            text: 'Pay Now',
            bgColor: AppColors.buttonColor,
          ),
        ),
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          title: const Text(
            'My Cart',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: GetBuilder<ShopController>(builder: (logic) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: logic.cart.length,
            itemBuilder: (BuildContext context, int index) {
              var product = logic.cart[index];
              return Container(
                margin: EdgeInsets.symmetric(
                  horizontal: Dimensions.width15,
                  vertical: Dimensions.height15,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.width15 - 5,
                  vertical: Dimensions.height15 - 5,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.055),
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                ),
                child: ListTile(
                  title: MyText(
                    text: product.name,
                    color: Colors.white,
                    size: Dimensions.font20,
                    weight: FontWeight.bold,
                  ),
                  subtitle: MyText(
                    size: Dimensions.font16 - 2,
                    text: product.price,
                    color: Colors.white,
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      logic.removeFromCart(product);
                    },
                    icon: Icon(
                      Icons.delete_forever,
                      color: Colors.white,
                      size: Dimensions.iconSize24,
                    ),
                  ),
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
