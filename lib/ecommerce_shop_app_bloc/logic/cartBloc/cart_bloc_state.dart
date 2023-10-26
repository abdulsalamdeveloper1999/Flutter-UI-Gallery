part of 'cart_bloc_bloc.dart';

class CartBlocState {
  List<ProductModel> list;
  double totalPrice;
  CartBlocState({required this.list, required this.totalPrice});
}
