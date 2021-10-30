import 'package:equatable/equatable.dart';

class ProductModel extends Equatable {
  final String name;
  final String category;
  final String imageUrl;
  final double price;
  final bool isRecommended;
  final bool isPopular;

  const ProductModel({
    required this.name,
    required this.category,
    required this.imageUrl,
    required this.price,
    required this.isRecommended,
    required this.isPopular,
  });

  @override
  List<Object?> get props =>
      [name, category, imageUrl, price, isRecommended, isPopular];

  static List<ProductModel> products = [
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
        isPopular: true),
    const ProductModel(
        name: "Water",
        category: "Water",
        imageUrl:
            "https://images.unsplash.com/photo-1606169109553-aa8c5e4a62b9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=871&q=80",
        price: 20000,
        isRecommended: true,
        isPopular: false),
  ];
}
