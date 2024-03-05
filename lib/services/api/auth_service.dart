import 'package:dio/dio.dart';

import '../../http/dio_client.dart';

class AuthService {
  Dio get _dio => DioClient().getClient();

  Future<Map<String, dynamic>> login(String email, String password) async {
      final response = await _dio.post('auth/token/login', data: {
        'email': email,
        'password': password,
      });

      return response.data;
  }

  Future<Map<String, dynamic>> register(
      String name, String email, String password) async {
    try {
      final response = await _dio.post('auth/registration', data: {
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
      final response = await _dio.get('users/me');

      print(response);
      return response.data;
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<Map<String, dynamic>> refreshToken(String refreshToken) async {
    try {
      final response = await _dio.get('auth/token/refresh');

      return response.data;
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
