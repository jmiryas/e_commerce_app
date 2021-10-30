part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

class ProductLoadingState extends ProductState {}

class ProductLoadedState extends ProductState {
  final List<ProductModel> products;

  const ProductLoadedState({required this.products});

  @override
  List<Object> get props => [products];
}

class ProductErrorState extends ProductState {}
