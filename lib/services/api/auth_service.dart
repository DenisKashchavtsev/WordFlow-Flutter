import 'package:dio/dio.dart';

import '../../http/dio_client.dart';

class AuthService {
  Dio get _dio => DioClient().getClient();

  Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      final response = await _dio.post('api/auth/token/login', data: {
        'email': email,
        'password': password,
      });

      return response.data;
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<Map<String, dynamic>> register(
      String name, String email, String password) async {
    try {
      final response = await _dio.post('api/auth/registration', data: {
        'name': name,
        'email': email,
        'password': password,
      });

      return response.data;
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<Map<String, dynamic>> getCurrentUser() async {
    try {
      final response = await _dio.get('api/users/me');

      return response.data;
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<Map<String, dynamic>> refreshToken(String refreshToken) async {
    try {
      final response = await _dio.get('api/auth/token/refresh');

      return response.data;
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
