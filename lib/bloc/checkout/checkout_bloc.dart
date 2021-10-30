import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/cart_model.dart';
import '../../bloc/cart/cart_bloc.dart';
import '../../models/product_model.dart';
import '../../models/checkout_model.dart';
import '../../repositories/checkout/checkout_repository.dart';

part 'checkout_event.dart';
part 'checkout_state.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  final CartBloc _cartBloc;
  final CheckoutRepository _checkoutRepository;

  StreamSubscription? _cartSubscription;
  StreamSubscription? _checkoutSubscription;

  CheckoutBloc(
      {required CartBloc cartBloc,
      required CheckoutRepository checkoutRepository})
      : _cartBloc = cartBloc,
        _checkoutRepository = checkoutRepository,
        super(cartBloc.state is CartLoadedState
            ? CheckoutLoadedState(
                products: (cartBloc.state as CartLoadedState).cart.products,
                subtotal:
                    (cartBloc.state as CartLoadedState).cart.subtotalString,
                deliveryFee:
                    (cartBloc.state as CartLoadedState).cart.deliveryFeeString,
                total: (cartBloc.state as CartLoadedState).cart.totalString,
              )
            : CheckoutLoadingState()) {
    _cartSubscription = cartBloc.stream.listen((state) {
      if (state is CartLoadedState) {
        add(UpdateCheckoutEvent(cart: state.cart));
      }
    });

    on<UpdateCheckoutEvent>(_updateCheckout);
    on<ConfirmCheckoutEvent>(_confirmCheckout);
  }

  void _updateCheckout(UpdateCheckoutEvent event, Emitter<CheckoutState> emit) {
    final state = this.state;

    if (state is CheckoutLoadedState) {
      emit(CheckoutLoadedState(
        email: event.email ?? state.email,
        fullName: event.fullName ?? state.fullName,
        products: event.cart?.products ?? state.products,
        deliveryFee: event.cart?.deliveryFeeString ?? state.deliveryFee,
        subtotal: event.cart?.subtotalString ?? state.subtotal,
        total: event.cart?.totalString ?? state.total,
        address: event.address ?? state.address,
        city: event.city ?? state.city,
        country: event.country ?? state.country,
        zipCode: event.zipCode ?? state.zipCode,
      ));
    }
  }

  void _confirmCheckout(
      ConfirmCheckoutEvent event, Emitter<CheckoutState> emit) async {
    _checkoutSubscription?.cancel();

    if (state is CheckoutLoadedState) {
      try {
        await _checkoutRepository.addCheckout(event.checkout);
        print("Done");
        // emit(CheckoutLoadingState());
      } catch (_) {}
    }
  }
}
