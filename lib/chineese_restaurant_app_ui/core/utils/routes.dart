import 'package:get/get.dart';

import '../../pages/food_details.dart';
import '../../pages/intro.dart';
import '../../pages/menu_page.dart';

class AppRoutes {
  static const String initial = '/';
  static const String menuPage = '/menu-page';
  static const String foodDetails = '/food_details-page';
  // static const String popularFood = '/popular-food';

  // static String getFoodDetails(foodModel food) => '$foodDetails?pageId=$food';

  static List<GetPage> routes = [
    GetPage(name: initial, page: () => const IntroPage()),
    GetPage(name: menuPage, page: () => const MenuPage()),
    GetPage(
      name: foodDetails,
      page: () {
        return const FoodDetailsPage();
      },
    ),
  ];
}
