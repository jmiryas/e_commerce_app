part of 'checkout_bloc.dart';

abstract class CheckoutEvent extends Equatable {
  const CheckoutEvent();

  @override
  List<Object?> get props => [];
}

class UpdateCheckoutEvent extends CheckoutEvent {
  final String? fullName;
  final String? email;
  final String? address;
  final String? city;
  final String? country;
  final String? zipCode;
  final CartModel? cart;

  const UpdateCheckoutEvent(
      {this.fullName,
      this.email,
      this.address,
      this.city,
      this.country,
      this.zipCode,
      this.cart});

  @override
  List<Object?> get props =>
      [fullName, email, address, city, country, zipCode, cart];
}

class ConfirmCheckoutEvent extends CheckoutEvent {
  final CheckoutModel checkout;

  const ConfirmCheckoutEvent({required this.checkout});

  @override
  List<Object?> get props => [checkout];
}
