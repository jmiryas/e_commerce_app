part of 'category_bloc.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object> get props => [];
}

class CategoryLoadingState extends CategoryState {}

class CategoryLoadedState extends CategoryState {
  final List<CategoryModel> categories;

  const CategoryLoadedState({this.categories = const <CategoryModel>[]});

  @override
  List<Object> get props => [categories];
}

class CategoryErrorState extends CategoryState {}
