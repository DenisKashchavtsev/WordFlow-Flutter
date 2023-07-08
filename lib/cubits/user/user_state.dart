part of 'user_cubit.dart';

@immutable
abstract class UserState {
  get user => null;
}

class UserStateInitial extends UserState {}

class UserStateLoading extends UserState {}

class UserStateLoaded extends UserState {}

class UserStateCurrentUserLoaded extends UserState {
  @override
  final Map<String, dynamic> user;

  UserStateCurrentUserLoaded({required this.user});
}

class UserStateToken extends UserState {
  final Map<String, dynamic>? tokens;

  UserStateToken({this.tokens});
}

class UserStateError extends UserState {
  final String message;

  UserStateError({required this.message});
}
