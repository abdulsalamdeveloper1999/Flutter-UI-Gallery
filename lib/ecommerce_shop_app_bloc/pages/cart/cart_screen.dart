import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_ui_portfolio/reusable_widgets/custom_text.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../logic/cartBloc/cart_bloc_bloc.dart';
import '../../logic/models/product_model/product_model.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<CartBloc, CartBlocState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              leading: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(Icons.arrow_back_ios, color: Colors.black),
              ),
            ),
            bottomNavigationBar: BottomWidget(
              state: state,
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    'My Cart',
                    style: GoogleFonts.notoSerif(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                if (state.list.isNotEmpty)
                  Expanded(
                    child: CartWidget(
                      data: state.list,
                      total: state.totalPrice,
                    ),
                  )
                else
                  const Center(
                    child: Text(
                      'No items in cart',
                      textAlign: TextAlign.center,
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class BottomWidget extends StatelessWidget {
  const BottomWidget({
    super.key,
    required this.state,
  });
  final CartBlocState state;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(36),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.purple,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomText(
                text: 'Total Price',
                color: Colors.purple[100],
              ),
              CustomText(
                weight: FontWeight.bold,
                size: 18,
                text: state.totalPrice.toStringAsFixed(2),
                color: Colors.white,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CartWidget extends StatelessWidget {
  final List<ProductModel> data;
  final double total;
  const CartWidget({super.key, required this.data, required this.total});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: data.length,
      itemBuilder: (_, index) {
        final product = data[index];
        return Container(
            // padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(top: 15),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              leading: CachedNetworkImage(
                height: 36,
                fit: BoxFit.cover,
                imageUrl: product.image.toString(),
                placeholder: (_, v) => const CircularProgressIndicator(),
              ),
              title: Text(
                product.title.toString(),
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
              subtitle: Text(
                product.price.toString(),
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
              trailing: IconButton(
                onPressed: () {
                  final cartBloc = context.read<CartBloc>();
                  cartBloc.add(
                    RemoveCartItemsEvent(index: index, context: context),
                  );
                },
                icon: const Icon(Icons.cancel),
              ),
            ));
      },
    );
  }
}
