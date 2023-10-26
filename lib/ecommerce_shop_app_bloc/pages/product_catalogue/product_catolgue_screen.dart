import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui_portfolio/ecommerce_shop_app_bloc/pages/product_catalogue/widget/product_card.dart';
import 'package:flutter_ui_portfolio/reusable_widgets/custom_text.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../logic/cartBloc/cart_bloc_bloc.dart';
import '../../logic/get_api_bloc/get_api_bloc.dart';
import 'widget/floating_button.dart';

class ProductCatalogueScreen extends StatefulWidget {
  const ProductCatalogueScreen({super.key});

  @override
  State<ProductCatalogueScreen> createState() => _ProductCatalogueScreenState();
}

class _ProductCatalogueScreenState extends State<ProductCatalogueScreen> {
  final apiBloc = GetApiBloc();
  final cartBloc = CartBloc();

  @override
  void initState() {
    super.initState();
    apiBloc.add(FetchProductApiEvent());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          floatingActionButton: BlocBuilder<GetApiBloc, GetApiState>(
            bloc: apiBloc,
            builder: (context, state) {
              if (state is GetApiLoaded) {
                log('message');
                return BlocBuilder<CartBloc, CartBlocState>(
                  builder: (context, state) {
                    final cartLength = state.list.length;
                    return FloatingButtonWidget(cartLength: cartLength);
                  },
                );
              } else {
                return const SizedBox();
              }
            },
          ),
          body: BlocBuilder<GetApiBloc, GetApiState>(
            bloc: apiBloc,
            builder: (context, state) {
              if (state is GetApiLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is GetApiError) {
                return Center(child: Text(state.error));
              } else if (state is GetApiLoaded) {
                return state.products.isEmpty
                    ? const Center(child: Text('No Products'))
                    : Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const CustomText(
                                  text: 'Welcome to Our Store',
                                  color: Colors.black,
                                ),
                                Text(
                                  'Discover Fresh Products',
                                  style: GoogleFonts.notoSerif(
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Divider(),
                                const CustomText(
                                  text: 'Explore Fresh Arrivals',
                                  color: Colors.black,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: LayoutBuilder(builder: (_, constraints) {
                              final crossAxisCount =
                                  constraints.maxWidth ~/ 150;
                              final childAspectRatio =
                                  constraints.maxWidth / (crossAxisCount * 200);
                              return GridView.builder(
                                itemCount: state.products.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: crossAxisCount,
                                  childAspectRatio: childAspectRatio,
                                ),
                                itemBuilder: (_, index) {
                                  var data = state.products[index];
                                  return ProductCard(data: data);
                                },
                              );
                            }),
                          )
                        ],
                      );
              }
              return const Text('No State');
            },
          )),
    );
  }
}
