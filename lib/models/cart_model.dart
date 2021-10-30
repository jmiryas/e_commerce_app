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
    if (subtotal >= 400000.0) {
      return "You have FREE DELIVERY";
    } else {
      double missing = 400000.0 - subtotal;
      return "Add Rp ${missing.toStringAsFixed(2)} for FREE DELIVERY";
    }
  }

  Map productQuantity(List<ProductModel> products) {
    var quantity = {};

    for (var item in products) {
      if (!quantity.containsKey(item)) {
        quantity[item] = 1;
      } else {
        quantity[item] += 1;
      }
    }

    return quantity;
  }

  String get subtotalString => subtotal.toStringAsFixed(2);

  String get totalString =>
      total(subtotal, deliveryFee(subtotal)).toStringAsFixed(2);

  String get deliveryFeeString => deliveryFee(subtotal).toStringAsFixed(2);

  String get freeDeliveryString => freeDelivery(subtotal);

  @override
  List<Object?> get props => [products];
}
