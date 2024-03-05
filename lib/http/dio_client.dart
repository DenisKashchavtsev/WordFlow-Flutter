import 'package:dio/dio.dart';

import '../configs/app.dart';
import 'interceptors/auth_interceptor.dart';
import 'interceptors/error_interceptor.dart';

class DioClient {
  Dio get _dio => Dio(BaseOptions(baseUrl: App.apiUrl))
    ..interceptors.add(AuthInterceptor())
    ..interceptors.add(ErrorInterceptor());

  getClient() {
    return _dio;
  }
}