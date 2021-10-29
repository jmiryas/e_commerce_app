import 'package:equatable/equatable.dart';

import '../models/product_model.dart';

class CartModel extends Equatable {
  final List<ProductModel> products;

  const CartModel({this.products = const <ProductModel>[]});

  double get subtotal =>
      products.fold(0, (total, current) => total + current.price);

  double deliveryFee(double subtotal) {
    if (subtotal >= 30.0) {
      return 0.0;
    } else {
      return 10.0;
    }
  }

  double total(double subtotal, double deliveryFee) {
    return subtotal + deliveryFee;
  }

  String freeDelivery(double subtotal) {
    if (subtotal >= 30.0) {
      return "You have FREE DELIVERY";
    } else {
      double missing = 30.0 - subtotal;
      return "Add \$${missing.toStringAsFixed(2)} for FREE DELIVERY";
    }
  }

  String get subtotalString => subtotal.toStringAsFixed(2);

  String get totalString =>
      total(subtotal, deliveryFee(subtotal)).toStringAsFixed(2);

  String get deliveryFeeString => deliveryFee(subtotal).toStringAsFixed(2);

  String get freeDeliveryString => freeDelivery(subtotal);

  @override
  List<Object?> get props => [products];
}
