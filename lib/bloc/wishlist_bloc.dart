import '../models/product_model.dart';
import '../models/wishlist_model.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistLoading()) {
    on<StartWishlist>(_mapStartWishlistToState);
    on<AddWishlistProduct>(_mapAddWishlistToState);
    on<RemoveWishlistProduct>(_mapRemoveWishlistToState);
  }

  void _mapStartWishlistToState(
      StartWishlist event, Emitter<WishlistState> emit) async {
    emit(WishlistLoading());

    try {
      await Future.delayed(const Duration(seconds: 1));
      emit(const WishlistLoaded(wishlist: WishlistModel()));
    } catch (_) {}
  }

  void _mapAddWishlistToState(
      AddWishlistProduct event, Emitter<WishlistState> emit) async {
    if (state is WishlistLoaded) {
      try {
        emit(WishlistLoaded(
            wishlist: WishlistModel(
                products: List.from((state as WishlistLoaded).wishlist.products)
                  ..add(event.product))));
      } catch (_) {}
    }
  }

  void _mapRemoveWishlistToState(
      RemoveWishlistProduct event, Emitter<WishlistState> emit) async {
    if (state is WishlistLoaded) {
      try {
        emit(WishlistLoaded(
            wishlist: WishlistModel(
                products: List.from((state as WishlistLoaded).wishlist.products)
                  ..remove(event.product))));
      } catch (_) {}
    }
  }
}
