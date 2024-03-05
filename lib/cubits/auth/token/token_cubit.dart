import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../service_locator.dart';
import '../../../services/api/auth_service.dart';
import '../../../services/navigation_service.dart';

part 'token_state.dart';

class TokenCubit extends Cubit<TokenState> {
  AuthService get _authService => ServiceLocator().authService;

  TokenCubit() : super(TokenStateInitial());

  final _storage = const FlutterSecureStorage();

  Future<void> getToken(String email, String password) async {
    emit(TokenStateLoading());
    _authService.login(email, password).then((response) async {

      await _storage.write(
        key: 'access_token',
        value: response['token'],
      );

      await _storage.write(
        key: 'refresh_token',
        value: response['refresh_token'],
      );

      emit(TokenStateLoaded(
          token: response['token'], refreshToken: response['refresh_token']));

      NavigationService().openDashboard();
    });
  }

  Future<void> refreshToken(String? refreshToken) async {
    emit(TokenStateLoading());

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

        emit(TokenStateLoaded(
            token: response['token'], refreshToken: response['refresh_token']));
      }).catchError((onError) {
        emit(TokenStateError(message: 'error'));
      });
    } else {
      _storage.delete(key: 'access_token');
      _storage.delete(key: 'refresh_token');
      NavigationService().openLogin();
    }
  }
}
