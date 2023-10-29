import 'package:flutter/material.dart';
import 'package:flutter_ui_portfolio/reusable_widgets/custom.dart';
import 'package:flutter_ui_portfolio/utils/colors.dart';
import '../home_expense/home_expense.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomwExpense()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: GlobalColors.kblack,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Decorative Icon or Logo
              Icon(
                Icons.track_changes,
                size: 80,
                color: GlobalColors.kblue,
              ),
              Space(height: 20), // Adding some spacing
              Text(
                'Expense Tracker',
                style: TextStyle(
                  fontSize: 24,
                  color: GlobalColors.kkwhite,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Space(height: 10), // Adding more spacing
              Space(
                width: 100,
                child: LinearProgressIndicator(
                  backgroundColor: GlobalColors.kkwhite,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    GlobalColors.kblue,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
