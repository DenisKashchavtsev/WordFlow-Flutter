part of 'category_cubit.dart';

@immutable
abstract class CategoryState {}

class CategoryStateInitial extends CategoryState {}

class CategoryStateLoading extends CategoryState {}

class CategoryStateLoaded extends CategoryState {
  final Category? category;
  final List<Category>? categories;
  final int? page;

  CategoryStateLoaded({this.category, this.categories, this.page});
}

class CategoryStateCreated extends CategoryState {}

class CategoryStateUpdated extends CategoryState {}

class CategoryStateDeleted extends CategoryState {}

class CategoryStateError extends CategoryState {}
