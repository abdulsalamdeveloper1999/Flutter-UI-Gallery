import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_ui_portfolio/reusable_widgets/custom.dart';

import '../../../logic/cartBloc/cart_bloc_bloc.dart';
import '../../../logic/models/product_model/product_model.dart';

class ProductCard extends StatelessWidget {
  final ProductModel data;
  const ProductCard({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 8, right: 8),
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.purple.withOpacity(0.2),
              blurRadius: 5,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: Column(
          children: [
            CachedNetworkImage(
              imageUrl: data.image!,
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.height * 0.1,
              fit: BoxFit.contain,
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(
                  color: Colors.purple,
                ),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            const Space(height: 10),
            Text(
              data.title!,
              maxLines: 1,
              overflow: TextOverflow.visible,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
            const Space(height: 5),
            MaterialButton(
              color: Colors.purple[300],
              onPressed: () {
                final cartBloc = context.read<CartBloc>();
                cartBloc.add(
                  AddCartItemsEvent(
                    product: data,
                    context: context,
                    total: data.price!.toStringAsFixed(2),
                  ),
                );
              },
              child: Text(
                data.price!.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
