import 'package:bloc/bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../service_locator.dart';
import '../../../services/api/auth_service.dart';
import '../../../services/navigation_service.dart';
import '../../../services/snack_bar_global_service.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  AuthService get _authService => ServiceLocator().authService;

  RegisterCubit() : super(RegisterStateInitial());

  Future<void> register(String name, String email, String password) async {
    emit(RegisterStateLoading());
    _authService.register(name, email, password).then((response) {
      emit(RegisterStateLoaded());
      SnackBarGlobalService.show('Success! Now you can authorize.');
      NavigationService().openLogin();
    }).catchError((onError) {
      emit(RegisterStateError(message: 'error'));
    });
  }
}
