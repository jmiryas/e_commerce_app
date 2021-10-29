import '../../models/cart_model.dart';
import '../../models/product_model.dart';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartLoadingState()) {
    on<CartInitialEvent>(_cartInitial);
    on<CartAddedProductEvent>(_cartAddProduct);
    on<CartRemovedProductEvent>(_cartRemoveProduct);
  }

  void _cartInitial(CartInitialEvent event, Emitter<CartState> emit) async {
    emit(CartLoadingState());

    try {
      await Future.delayed(const Duration(seconds: 1));
      emit(const CartLoadedState(cart: CartModel()));
    } catch (_) {
      emit(CartErrorState());
    }
  }

  void _cartAddProduct(
      CartAddedProductEvent event, Emitter<CartState> emit) async {
    if (state is CartLoadedState) {
      try {
        emit(CartLoadedState(
            cart: CartModel(
                products: List.from((state as CartLoadedState).cart.products)
                  ..add(event.product))));
      } catch (_) {}
    }
  }

  void _cartRemoveProduct(
      CartRemovedProductEvent event, Emitter<CartState> emit) async {
    if (state is CartLoadedState) {
      try {
        emit(CartLoadedState(
            cart: CartModel(
                products: List.from((state as CartLoadedState).cart.products)
                  ..remove(event.product))));
      } catch (_) {}
    }
  }
}
