import 'package:bloc/bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../service_locator.dart';
import '../../services/api/auth_service.dart';
import '../../services/navigation_service.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  AuthService get _authService => ServiceLocator().authService;

  UserCubit() : super(UserStateInitial());

  final _storage = const FlutterSecureStorage();

  Future<void> getCurrentUser() async {
    _authService.getCurrentUser().then((response) async {
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('user.ulid', response['ulid']);
      prefs.setString('user.email', response['email']);
      prefs.setString('user.name', response['name']);
    }).catchError((onError) {
      emit(UserStateError(message: 'error'));
    });
  }

  Future<void> login(String email, String password) async {
    emit(UserStateLoading());

    _authService.login(email, password).then((response) async {
      await _storage.write(
        key: 'access_token',
        value: response['token'],
      );
      await _storage.write(
        key: 'refresh_token',
        value: response['refresh_token'],
      );
      emit(UserStateToken(tokens: response));
      await getCurrentUser();
      emit(UserStateLoaded());
      NavigationService().openDashboard();
    }).catchError((onError) {
      emit(UserStateError(message: 'error'));
    });
  }

  Future<void> refreshToken(String? refreshToken) async {
    emit(UserStateLoading());

    if (refreshToken != null) {
      _authService.refreshToken(refreshToken).then((response) async {
        await _storage.write(
          key: 'access_token',
          value: response['token'],
        );
        await _storage.write(
          key: 'refresh_token',
          value: response['refresh_token'],
        );
        emit(UserStateToken(tokens: response));
        emit(UserStateLoaded());
      }).catchError((onError) {
        emit(UserStateError(message: 'error'));
      });
    } else {
      _storage.delete(key: 'access_token');
      _storage.delete(key: 'refresh_token');
      NavigationService().openLogin();
    }
  }

  Future<void> register(String name, String email, String password) async {
    emit(UserStateLoading());
    _authService.register(name, email, password).then((response) {
      emit(UserStateToken(tokens: response));
      emit(UserStateLoaded());
      NavigationService().openLogin();
    }).catchError((onError) {
      emit(UserStateError(message: 'error'));
    });
  }
}
