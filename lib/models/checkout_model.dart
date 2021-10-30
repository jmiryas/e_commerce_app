import 'package:equatable/equatable.dart';

import '../models/product_model.dart';

class CheckoutModel extends Equatable {
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

  const CheckoutModel({
    required this.fullName,
    required this.email,
    required this.address,
    required this.city,
    required this.country,
    required this.zipCode,
    required this.products,
    required this.subtotal,
    required this.deliveryFee,
    required this.total,
  });

  Map<String, Object> toDocument() {
    Map customerAddress = {};

    customerAddress["address"] = address;
    customerAddress["city"] = city;
    customerAddress["country"] = country;
    customerAddress["zipCode"] = zipCode;

    return {
      "customerAddress": customerAddress,
      "customerName": fullName!,
      "customerEmail": email!,
      "products": products!.map((item) => item.name).toList(),
      "subtotal": subtotal!,
      "deliveryFee": deliveryFee!,
      "total": total!
    };
  }

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
