part of 'user_cubit.dart';

abstract class UserState {}

class UserStateInitial extends UserState {}

class UserStateLoading extends UserState {}

class UserStateLoaded extends UserState {
  final User user;

  UserStateLoaded({required this.user});
}

class UserStateError extends UserState {
  final String? message;

  UserStateError({required this.message});
}
