// import 'package:flutter/material.dart';

// import 'coffe_ui/screens/coffe_home.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Ui Portfolios',
//       theme: ThemeData(
//         useMaterial3: true,
//       ),
//       home: const CoffeHomeView(),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'chineese_restaurant_app_ui/core/controllers/shop_controller.dart';
import 'chineese_restaurant_app_ui/core/helper/helper_class.dart';
import 'chineese_restaurant_app_ui/core/utils/routes.dart';

Helper dep = Helper();
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  dep.init();
  runApp(const MyMain());
}

class MyMain extends StatelessWidget {
  const MyMain({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<ShopController>();
    return GetMaterialApp(
      initialRoute: AppRoutes.initial,
      getPages: AppRoutes.routes,
      debugShowCheckedModeBanner: false,
      title: 'Restaurant App',
      theme: ThemeData(
        useMaterial3: true,
      ),
    );
  }
}
