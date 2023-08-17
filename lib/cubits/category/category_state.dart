part of 'category_cubit.dart';

@immutable
abstract class CategoryState {}

class CategoryStateInitial extends CategoryState {}

class CategoryStateLoaded extends CategoryState {
  final WordCategory category;
  final List<WordWord> words;
  final int? page;

  CategoryStateLoaded({required this.category, required this.words, required this.page});
}

class CategoriesStateLoaded extends CategoryState {
  final List<WordCategory> categories;
  final int? page;

  CategoriesStateLoaded({required this.categories, this.page});
}

class CategoriesStateEmpty extends CategoryState {}

class CategoryStateCreated extends CategoryState {}

class CategoryStateUpdated extends CategoryState {}

class CategoryStateDeleted extends CategoryState {}

class CategoryStateError extends CategoryState {}
