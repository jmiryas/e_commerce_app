part of 'checkout_bloc.dart';

abstract class CheckoutState extends Equatable {
  const CheckoutState();

  @override
  List<Object?> get props => [];
}

class CheckoutLoadingState extends CheckoutState {}

class CheckoutLoadedState extends CheckoutState {
  final String? fullName;
  final String? email;
  final String? address;
  final String? city;
  final String? country;
  final String? zipCode;
  final List<ProductModel>? products;
  final String? subtotal;
  final String? deliveryFee;
  final String? total;
  final CheckoutModel checkout;

  CheckoutLoadedState({
    this.fullName,
    this.email,
    this.address,
    this.city,
    this.country,
    this.zipCode,
    this.products,
    this.subtotal,
    this.deliveryFee,
    this.total,
  }) : checkout = CheckoutModel(
            fullName: fullName,
            email: email,
            address: address,
            city: city,
            country: country,
            zipCode: zipCode,
            products: products,
            subtotal: subtotal,
            deliveryFee: deliveryFee,
            total: total);

  @override
  List<Object?> get props => [
        fullName,
        email,
        address,
        city,
        country,
        zipCode,
        products,
        subtotal,
        deliveryFee,
        total,
      ];
}

class CheckoutErrorState extends CheckoutState {}
