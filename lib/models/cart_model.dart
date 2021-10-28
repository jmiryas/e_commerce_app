import 'package:equatable/equatable.dart';

import '../models/product_model.dart';

class CartModel extends Equatable {
  CartModel();

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

  List<ProductModel> products = [
    const ProductModel(
        name: "Smoothies 01",
        category: "Smoothies",
        imageUrl:
            "https://images.unsplash.com/photo-1619898804188-e7bad4bd2127?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=871&q=80",
        price: 10000,
        isRecommended: true,
        isPopular: true),
    const ProductModel(
        name: "Smoothies 02",
        category: "Smoothies",
        imageUrl:
            "https://images.unsplash.com/photo-1539574610665-dc92264e9c4f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
        price: 20000,
        isRecommended: false,
        isPopular: false),
    const ProductModel(
        name: "Soft Drink 01",
        category: "Soft Drink",
        imageUrl:
            "https://images.unsplash.com/photo-1603534863485-679a90930b28?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=870&q=80",
        price: 10000,
        isRecommended: false,
        isPopular: true),
    const ProductModel(
        name: "Soft Drink 02",
        category: "Soft Drink",
        imageUrl:
            "https://images.unsplash.com/photo-1606168094336-48f205276929?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
        price: 15000,
        isRecommended: false,
        isPopular: true)
  ];

  @override
  List<Object?> get props => throw UnimplementedError();
}
