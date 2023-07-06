import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryStateInitial());

  getList({int page = 1}) async {
    // print(page);
    // emit(CategoryStateLoading());
    // emit(CategoryStateLoaded(chats: await _chatRepository.getList(page)));
  }

  getOne(doc) async {
    // emit(CategoryStateLoading());
    // emit(CategoryStateLoaded(chat: await _chatRepository.getOne(doc)));
  }

  create(name) async {
    // emit(CategoryStateLoading());
    // if (await _chatRepository.create(name, _auth.currentUser?.uid)) {
    //   emit(CategoryStateCreated());
    // } else {
    //   emit(CategoryStateError());
    // }
  }

  update(doc, name) async {
    // emit(CategoryStateLoading());
    // if (await _chatRepository.update(doc, name)) {
    //   emit(CategoryStateUpdated());
    // } else {
    //   emit(CategoryStateError());
    // }
  }

  delete(doc) async {
    // emit(CategoryStateLoading());
    // if (await _chatRepository.delete(doc)) {
    //   emit(CategoryStateDeleted());
    // } else {
    //   emit(CategoryStateError());
    // }
  }
}
