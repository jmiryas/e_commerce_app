part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

class CartLoadingState extends CartState {}

class CartLoadedState extends CartState {
  final CartModel cart;

  const CartLoadedState({this.cart = const CartModel()});

  @override
  List<Object> get props => [cart];
}

class CartErrorState extends CartState {}
