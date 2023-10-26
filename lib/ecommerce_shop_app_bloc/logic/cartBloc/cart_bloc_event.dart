part of 'cart_bloc_bloc.dart';

abstract class CartBlocEvent extends Equatable {}

class AddCartItemsEvent extends CartBlocEvent {
  final ProductModel product;
  final String total;
  final BuildContext context; // Add the context property

  AddCartItemsEvent({
    required this.product,
    required this.context,
    required this.total,
  });

  @override
  List<Object> get props => [product];
}

class RemoveCartItemsEvent extends CartBlocEvent {
  final int index;
  final BuildContext context; // Add the context property

  RemoveCartItemsEvent({required this.index, required this.context});

  @override
  List<Object> get props => [index];
}
