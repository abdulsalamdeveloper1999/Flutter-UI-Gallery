import 'package:get/get.dart';

import '../models/food_model.dart';

class ShopController extends GetxController {
  final List<FoodModel> _foodMenu = [
    FoodModel(
      name: 'Salmon Sushi',
      price: '\$21',
      imagePath: 'assets/images/sushi (2).png',
      rating: '5.0',
    ),
    FoodModel(
      name: 'Tuna',
      price: '\$35',
      imagePath: 'assets/images/sushi (3).png',
      rating: '4.8',
    ),
    FoodModel(
      name: 'Sushi',
      price: '\$15',
      imagePath: 'assets/images/sushi (1).png',
      rating: '3.0',
    ),
  ];

  final List<FoodModel> _cart = [];

  List<FoodModel> get cart => _cart;

  List<FoodModel> get foodMenu => _foodMenu;

  void addToCart(FoodModel food, int quantity) {
    // Check if the same food is already in the cart based on its name
    if (_cart.any((cartFood) => cartFood.name == food.name)) {
      // You can handle this case as needed, like updating quantity.
      // For simplicity, I'll assume you want to increase the quantity.
      for (int i = 0; i < quantity; i++) {
        _cart.add(food);
      }
    } else {
      // Food not in cart, add it.
      for (int i = 0; i < quantity; i++) {
        _cart.add(food);
      }
    }
    update();
  }

  void removeFromCart(FoodModel food) {
    _cart.remove(food);
    update();
  }
}
