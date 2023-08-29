import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

import '../../models/word_word.dart';
import '../../service_locator.dart';
import '../../services/api/word_service.dart';
import '../../services/navigation_service.dart';

part 'word_state.dart';

class WordCubit extends Cubit<WordState> {
  WordCubit() : super(WordStateInitial());

  WordService get _wordService => ServiceLocator().wordService;

  getList({int page = 1}) async {}

  getOne(String id) async {
    await _wordService.show(id).then((response) async {
      emit(WordStateLoaded(word: response));
    });
  }

  create(String categoryId, String source, String translate) async {
    await _wordService
        .create(categoryId, source, translate)
        .then((response) async {
      emit(WordStateCreated());
      NavigationService().back();
    });
  }

  update(String id, String source, String translate) async {
    await _wordService
        .update(id, source, translate)
        .then((response) async {
      emit(WordStateUpdated());
      NavigationService().back();
    });
  }

  delete(List ids) async {
    _wordService.delete(ids);
    emit(WordStateDeleted());
  }
}
