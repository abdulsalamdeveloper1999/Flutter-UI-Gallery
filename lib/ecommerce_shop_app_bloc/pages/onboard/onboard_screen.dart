import 'package:flutter/material.dart';
import 'package:flutter_ui_portfolio/chineese_restaurant_app_ui/core/componenets/mybutton.dart';
import 'package:flutter_ui_portfolio/reusable_widgets/custom.dart';
import 'package:flutter_ui_portfolio/reusable_widgets/custom_text.dart';
import 'package:google_fonts/google_fonts.dart';

import '../product_catalogue/product_catolgue_screen.dart';

class OnboardScreen extends StatelessWidget {
  const OnboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Space(height: MediaQuery.of(context).size.height * 0.15),
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  'assets/e_commerce_onborad.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              const Space(height: 16),
              Text(
                'Discover Savings\nEvery Day!',
                textAlign: TextAlign.center,
                style: GoogleFonts.notoSerif(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Space(height: 24),
              CustomText(
                align: TextAlign.center,
                text: 'Explore our new arrivals',
                color: Colors.grey[600],
              ),
              const Spacer(),
              MyButton(
                width: MediaQuery.of(context).size.width * 0.5,
                radius: 12,
                textSize: 12,
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const ProductCatalogueScreen()));
                },
                text: 'Get Started',
                bgColor: Colors.purple[400]!,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
