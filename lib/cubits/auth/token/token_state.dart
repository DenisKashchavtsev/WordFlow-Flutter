part of 'token_cubit.dart';

abstract class TokenState {}

class TokenStateInitial extends TokenState {}

class TokenStateLoading extends TokenState {}

class TokenStateLoaded extends TokenState {
  final String? token;
  final String? refreshToken;

  TokenStateLoaded({required this.token, required this.refreshToken});
}

class TokenStateError extends TokenState {
  final String? message;

  TokenStateError({required this.message});
}
