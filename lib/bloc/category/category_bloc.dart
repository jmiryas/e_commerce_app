import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/category_model.dart';
import '../../repositories/category/category_repository.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository _categoryRepository;
  StreamSubscription? _categorySubscription;

  CategoryBloc({
    required CategoryRepository categoryRepository,
  })  : _categoryRepository = categoryRepository,
        super(CategoryLoadingState()) {
    on<LoadCategoryEvent>(_loadCategory);
    on<UpdateCategoryEvent>(_updateCategory);
  }

  void _loadCategory(LoadCategoryEvent event, Emitter<CategoryState> emit) {
    _categorySubscription?.cancel();

    _categorySubscription =
        _categoryRepository.getAllCategories().listen((categories) {
      return add(UpdateCategoryEvent(categories: categories));
    });
  }

  void _updateCategory(UpdateCategoryEvent event, Emitter<CategoryState> emit) {
    emit(CategoryLoadedState(categories: event.categories));
  }
}
