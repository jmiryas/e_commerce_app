part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class CartInitialEvent extends CartEvent {}

class CartAddedProductEvent extends CartEvent {
  final ProductModel product;

  const CartAddedProductEvent(this.product);

  @override
  List<Object> get props => [product];
}

class CartRemovedProductEvent extends CartEvent {
  final ProductModel product;

  const CartRemovedProductEvent(this.product);

  @override
  List<Object> get props => [product];
}
