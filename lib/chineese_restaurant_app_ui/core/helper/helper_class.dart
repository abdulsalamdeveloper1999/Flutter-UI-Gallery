import 'package:get/get.dart';

import '../controllers/shop_controller.dart';

class Helper {
  Future<void> init() async {
    Get.lazyPut(() => ShopController());
  }
}
