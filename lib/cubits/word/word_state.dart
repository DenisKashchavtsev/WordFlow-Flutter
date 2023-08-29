part of 'word_cubit.dart';

@immutable
abstract class WordState {}

class WordStateInitial extends WordState {}

class WordStateLoaded extends WordState {
  final WordWord word;

  WordStateLoaded({required this.word});
}

class WordsStateLoaded extends WordState {
  final List<WordWord> words;
  final int? page;

  WordsStateLoaded({required this.words, this.page});
}

class WordsStateEmpty extends WordState {}

class WordStateCreated extends WordState {}

class WordStateUpdated extends WordState {}

class WordStateDeleted extends WordState {}

class WordStateError extends WordState {}
