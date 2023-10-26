import 'dart:async';
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui_portfolio/reusable_widgets/custom_snackbar.dart';

import '../models/product_model/product_model.dart';

part 'cart_bloc_event.dart';
part 'cart_bloc_state.dart';

class CartBloc extends Bloc<CartBlocEvent, CartBlocState> {
  CartBloc() : super(CartBlocState(list: [], totalPrice: 0.0)) {
    on<CartBlocEvent>(_mapEventToState);
  }

  Future<void> _mapEventToState(
    CartBlocEvent event,
    Emitter<CartBlocState> emit,
  ) async {
    // Get the current list of products from the state
    List<ProductModel> currentList = state.list;
    double total = state.totalPrice;

    if (event is AddCartItemsEvent) {
      // Check if the product with the same ID already exists in the cart
      if (currentList.any((e) => e.id == event.product.id)) {
        showSnackBar(event.context, 'Product already exists in the cart');
        log('product exists ${event.product.id}');
      } else {
        // Product doesn't exist, add it to the current list
        currentList.add(event.product);

        // Update the total price by adding the price of the new item
        total += event.product.price!;

        // Format total with two decimal places
        String formattedTotal = total.toStringAsFixed(2);

        showSnackBar(event.context, 'Product Added To Cart');
        log('Total price: $formattedTotal');
        emit(CartBlocState(list: currentList, totalPrice: total));
      }
    } else if (event is RemoveCartItemsEvent) {
      if (currentList.isNotEmpty) {
        // Remove the item at the specified index
        log('before remove ${currentList.length}');

        // Ensure the index is valid and update the total price
        if (event.index >= 0 && event.index < currentList.length) {
          total -= currentList[event.index].price!;
          log(total.toString());
        } else {
          // Handle an invalid index, for example, by showing an error message
          log('Invalid index: ${event.index}');
        }
        currentList.removeAt(event.index);
        // Format total with two decimal places
        String formattedTotal = total.toStringAsFixed(2);

        // showSnackBar(event.context, 'Item has been removed');
        log('Total price: $formattedTotal');
        log('after remove ${currentList.length}');
        emit(CartBlocState(list: currentList, totalPrice: total));
      }
    }
  }
}
