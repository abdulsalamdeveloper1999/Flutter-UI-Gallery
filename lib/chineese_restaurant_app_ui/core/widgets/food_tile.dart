// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/food_model.dart';
import '../utils/dimensions.dart';

class FoodTile extends StatelessWidget {
  final Function()? onTap;
  final FoodModel food;
  const FoodTile({
    Key? key,
    this.onTap,
    required this.food,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(right: Dimensions.width20),
        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(Dimensions.radius20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              food.imagePath,
              height: Dimensions.height120 + 20,
              fit: BoxFit.cover,
            ),
            Text(
              food.name,
              style: GoogleFonts.dmSerifDisplay(fontSize: Dimensions.font20),
            ),
            SizedBox(height: Dimensions.height20),
            SizedBox(
              width: Dimensions.width20 * 7,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$ ${food.price}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[700],
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow[800],
                      ),
                      SizedBox(width: Dimensions.width10 - 5),
                      Text(
                        food.rating,
                        style: const TextStyle(color: Colors.grey),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
