import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../cubits/user/user_cubit.dart';

class AuthInterceptor extends Interceptor {
  final _storage = const FlutterSecureStorage();

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    await _storage.read(key: 'access_token').then((value) {
      if (value != null) {
        options.headers['Authorization'] = 'Bearer $value';
      }
    });
    print(options);
    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    String? refreshToken;
    await _storage.read(key: 'refresh_token').then((value) async {
      refreshToken = value;
    });

    if (err.response?.statusCode == 401) {
      UserCubit().refreshToken(refreshToken);
    }

    super.onError(err, handler);
  }

}
