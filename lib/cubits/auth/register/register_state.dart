part of 'register_cubit.dart';

abstract class RegisterState {}

class RegisterStateInitial extends RegisterState {}

class RegisterStateLoading extends RegisterState {}

class RegisterStateLoaded extends RegisterState {}

class RegisterStateError extends RegisterState {
  final String? message;

  RegisterStateError({required this.message});
}
