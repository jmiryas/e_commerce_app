import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/models/product_model.dart';
import 'package:e_commerce_app/repositories/product/product_repository.dart';
import 'package:equatable/equatable.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository _productRepository;
  StreamSubscription? _categorySubscription;

  ProductBloc({required ProductRepository productRepository})
      : _productRepository = productRepository,
        super(ProductLoadingState()) {
    on<LoadProductEvent>(_loadProducts);
    on<UpdateProductEvent>(_updateProducts);
  }

  void _loadProducts(LoadProductEvent event, Emitter<ProductState> emit) {
    _categorySubscription?.cancel();

    _categorySubscription =
        _productRepository.getAllProducts().listen((products) {
      return add(UpdateProductEvent(products: products));
    });
  }

  void _updateProducts(UpdateProductEvent event, Emitter<ProductState> emit) {
    emit(ProductLoadedState(products: event.products));
  }
}
