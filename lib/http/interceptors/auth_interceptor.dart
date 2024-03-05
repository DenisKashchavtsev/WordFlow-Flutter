import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../cubits/auth/token/token_cubit.dart';
import '../../cubits/user/user_cubit.dart';

class AuthInterceptor extends Interceptor {
  final _storage = const FlutterSecureStorage();

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {

    options.headers['Content-Type'] = 'application/json';

    await _storage.read(key: 'access_token').then((value) {
      if (value != null) {
        options.headers['Authorization'] = 'Bearer $value';
      }
    });
    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    String? refreshToken;
    await _storage.read(key: 'refresh_token').then((value) async {
      refreshToken = value;
    });

    if (err.requestOptions.path != 'auth/token/login') {
      if (err.response?.statusCode == 401) {
        TokenCubit().refreshToken(refreshToken);
      }
    }

    super.onError(err, handler);
  }

}
