import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

class CategoryModel extends Equatable {
  final String name;
  final String imageUrl;

  const CategoryModel({required this.name, required this.imageUrl});

  @override
  List<Object> get props => [name, imageUrl];

  static List<CategoryModel> categories = [
    const CategoryModel(
        name: "Soft Drink",
        imageUrl:
            "https://images.unsplash.com/photo-1601055903647-ddf1ee9701b7?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=870&q=80"),
    const CategoryModel(
        name: "Smoothies",
        imageUrl:
            "https://images.unsplash.com/photo-1502741224143-90386d7f8c82?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=869&q=80"),
    const CategoryModel(
        name: "Water",
        imageUrl:
            "https://images.unsplash.com/photo-1563374928-66e57628d1b6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80"),
  ];
}
