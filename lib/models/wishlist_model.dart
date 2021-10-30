import 'package:e_commerce_app/models/product_model.dart';
import 'package:equatable/equatable.dart';

class WishlistModel extends Equatable {
  final List<ProductModel> products;

  const WishlistModel({this.products = const <ProductModel>[]});

  @override
  List<Object?> get props => [products];
}
