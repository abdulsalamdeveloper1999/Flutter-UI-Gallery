import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../core/componenets/my_text.dart';
import '../core/componenets/mybutton.dart';
import '../core/controllers/shop_controller.dart';
import '../core/models/food_model.dart';
import '../core/utils/app_colors.dart';
import '../core/utils/dimensions.dart';

class FoodDetailsPage extends StatefulWidget {
  final FoodModel? food;
  const FoodDetailsPage({super.key, this.food});

  @override
  State<FoodDetailsPage> createState() => _FoodDetailsPageState();
}

class _FoodDetailsPageState extends State<FoodDetailsPage> {
  int quantity = 0;

  void updatePrice(bool isIncrement) {
    if (isIncrement) {
      setState(() {
        quantity = quantity + 1;
      });
    } else {
      setState(() {
        quantity = quantity - 1;
      });
    }
  }

  void addToCart() {
    final shop = Get.find<ShopController>();

    if (quantity > 0) {
      shop.addToCart(widget.food!, quantity);
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: MyText(
              text: 'Successfully Added To Cart',
              size: Dimensions.font16,
            ),
            actions: [
              GestureDetector(
                onTap: () {
                  Get.back();
                  Get.back();
                },
                child: Icon(
                  Icons.check_rounded,
                  color: AppColors.backgroundColor,
                ),
              )
            ],
          );
        },
      );
    } else {
      Get.snackbar(
        'Increase quantity',
        'Quantity should be more than 1',
        backgroundColor: AppColors.backgroundColor,
        colorText: Colors.white,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Container(
          height: Dimensions.height120 * 1.4,
          padding: EdgeInsets.symmetric(
            horizontal: Dimensions.width20,
            vertical: Dimensions.height15,
          ),
          color: AppColors.backgroundColor,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyText(
                    text: "${widget.food!.price}.00",
                    color: Colors.white,
                    weight: FontWeight.bold,
                    size: Dimensions.font20,
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: quantity != 0
                            ? () {
                                updatePrice(false);
                              }
                            : null,
                        child: CircleAvatar(
                          backgroundColor: Colors.white.withOpacity(0.1),
                          child: Center(
                            child: Icon(
                              Icons.remove,
                              size: Dimensions.iconSize24,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: Dimensions.width20),
                      MyText(
                        text: quantity.toString(),
                        color: Colors.white,
                        weight: FontWeight.bold,
                        size: Dimensions.font20,
                      ),
                      SizedBox(width: Dimensions.width20),
                      GestureDetector(
                        onTap: quantity != 20
                            ? () {
                                updatePrice(true);
                              }
                            : null,
                        child: CircleAvatar(
                          backgroundColor: Colors.white.withOpacity(0.1),
                          child: Center(
                            child: Icon(
                              Icons.add,
                              size: Dimensions.iconSize24,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(height: Dimensions.height20),
              MyButton(
                bgColor: Colors.white.withOpacity(0.055),
                onTap: () => addToCart(),
                text: 'Add To Cart',
              )
            ],
          ),
        ),
        appBar: AppBar(
          leading: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: const Icon(Icons.arrow_back_ios)),
        ),
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.width20 + 5,
                ),
                child: ListView(
                  children: [
                    Image.asset(
                      widget.food!.imagePath,
                      height: Dimensions.height20 * 10,
                      fit: BoxFit.fitHeight,
                    ),
                    SizedBox(height: Dimensions.height30 - 5),
                    Row(
                      children: [
                        MyText(
                          text: widget.food!.rating,
                          color: Colors.grey[800],
                          size: Dimensions.font16,
                          weight: FontWeight.bold,
                        ),
                        SizedBox(width: Dimensions.width10),
                        Icon(
                          Icons.star,
                          color: Colors.yellow[800],
                        )
                      ],
                    ),
                    SizedBox(height: Dimensions.height30 - 5),
                    Text(
                      widget.food!.name,
                      style: GoogleFonts.dmSerifDisplay(
                          fontSize: Dimensions.font20),
                    ),
                    SizedBox(height: Dimensions.height20),
                    MyText(
                      text: 'Description',
                      size: Dimensions.font16 + 2,
                      weight: FontWeight.bold,
                    ),
                    SizedBox(height: Dimensions.height20),
                    MyText(
                      text:
                          'Sushi rice is short-grain white rice seasoned with a mixture of rice vinegar, sugar, and salt. This gives sushi rice its characteristic sweet and slightly tangy flavor.',
                      size: Dimensions.font16,
                      color: Colors.grey[600],
                      height: 2.0,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
