import 'package:flutter/material.dart';

import '../../cart/cart_screen.dart';

class FloatingButtonWidget extends StatelessWidget {
  const FloatingButtonWidget({
    super.key,
    required this.cartLength,
  });

  final int cartLength;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        backgroundColor: Colors.purple[300],
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const CartScreen(),
            ),
          );
        },
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            const Icon(
              Icons.shopping_bag,
              color: Colors.white,
            ),
            cartLength > 0
                ? Positioned(
                    bottom: 25,
                    right: -15,
                    child: CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 10,
                      child: FittedBox(
                        child: Text(
                          cartLength.toString(),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  )
                : const SizedBox(),
          ],
        ));
  }
}
