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
import 'package:flutter_ui_portfolio/expense_tracker_app/data/expense_data.dart';
import 'package:flutter_ui_portfolio/expense_tracker_app/pages/splash/splash_screen.dart';
import 'package:flutter_ui_portfolio/utils/colors.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:provider/provider.dart';

import 'expense_tracker_app/utils/constants.dart';

///sushi man
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import 'chineese_restaurant_app_ui/core/controllers/shop_controller.dart';
// import 'chineese_restaurant_app_ui/core/helper/helper_class.dart';
// import 'chineese_restaurant_app_ui/core/utils/routes.dart';

// Helper dep = Helper();
// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   dep.init();
//   runApp(const MyMain());
// }

// class MyMain extends StatelessWidget {
//   const MyMain({super.key});

//   @override
//   Widget build(BuildContext context) {
//     Get.find<ShopController>();
//     return GetMaterialApp(
//       initialRoute: AppRoutes.initial,
//       getPages: AppRoutes.routes,
//       debugShowCheckedModeBanner: false,
//       title: 'Restaurant App',
//       theme: ThemeData(
//         useMaterial3: true,
//       ),
//     );
//   }
// }

// ///Grocery App

// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   runApp(const MyMain());
// }

// class MyMain extends StatelessWidget {
//   const MyMain({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider(
//           create: (context) => GetApiBloc(),
//         ),
//         BlocProvider(
//           create: (context) => CartBloc(),
//         ),
//       ],
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: 'E-commerce App',
//         theme: ThemeData(useMaterial3: true),
//         home: const OnboardScreen(),
//       ),
//     );
//   }
// }

///Expense tracker
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //initialize hive
  await Hive.initFlutter();

  //open hive box
  await Hive.openBox(hiveDb);

  runApp(const MyMain());
}

class MyMain extends StatelessWidget {
  const MyMain({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ExpenseData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Expense Tracker',
        theme: ThemeData(
          useMaterial3: false,
          scaffoldBackgroundColor: GlobalColors.kblack,
          appBarTheme: const AppBarTheme(
            centerTitle: true,
            titleTextStyle: TextStyle(
              color: GlobalColors.kkwhite,
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
            elevation: 0,
            color: Colors.blue,
          ),
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
