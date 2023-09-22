import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

import '../../models/word_category.dart';
import '../../models/word_word.dart';
import '../../service_locator.dart';
import '../../services/api/category_service.dart';
import '../../services/navigation_service.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryStateInitial());

  CategoryService get _categoryService => ServiceLocator().categoryService;

  getList({int page = 1}) async {
    await _categoryService.getList(page).then((response) async {
      if (response.isEmpty && page == 1) {
        emit(CategoriesStateEmpty());
      } else if(response.isNotEmpty) {
        if (state is CategoriesStateLoaded) {
          final currentState = state as CategoriesStateLoaded;
          if (currentState.categories.isNotEmpty) {
            response = [...currentState.categories, ...response];
          }
        }
        emit(CategoriesStateLoaded(categories: response, page: page));
      }
    });
  }

  getOne(id) async {
    await _categoryService.show(id).then((response) async {
      emit(CategoryStateLoaded(category: response, words: const [], page: 1));
    });

    getCategoryWords(id: id, page: 1);
  }

  getCategoryWords({required String id, required int page}) async {
    await _categoryService.getCategoryWords(id, page).then((response) async {

      if (state is CategoryStateLoaded) {
        final currentState = state as CategoryStateLoaded;
        if (currentState.words.isNotEmpty) {
          response = [...currentState.words, ...response];
        }
        emit(CategoryStateLoaded(category: currentState.category, words: response, page: page));
      }
    });
  }

  create(name) async {
    await _categoryService.create(name).then((response) async {
      emit(CategoryStateCreated());
      NavigationService().openDashboard(selectedIndex: NavigationService.dashboardLearningTab);
    });
  }

  update(id, name) async {
    await _categoryService.update(id, name).then((response) async {
      emit(CategoryStateUpdated());
      NavigationService().openDashboard(selectedIndex: NavigationService.dashboardLearningTab);
    });
  }

  delete(List ids) async {
    _categoryService.delete(ids);
    emit(CategoryStateDeleted());
    NavigationService().openDashboard(selectedIndex: NavigationService.dashboardLearningTab);
  }
}
