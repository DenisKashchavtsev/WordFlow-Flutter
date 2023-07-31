import 'package:dio/dio.dart';

import '../http/dio_client.dart';

class AuthService {
  Dio get _dio => DioClient().getClient();

  Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      final response =
          await _dio.post('api/auth/token/login', data: {
        'email': email,
        'password': password,
      });

      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Ошибка входа: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Ошибка входа: $e');
    }
  }

  Future<Map<String, dynamic>> register(
      String name, String email, String password) async {
    try {
      final response =
          await _dio.post('api/auth/registration', data: {
        'name': name,
        'email': email,
        'password': password,
      });

      if (response.statusCode == 201) {
        return response.data;
      } else {
        throw Exception('Ошибка регистрации: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Ошибка регистрации: $e');
    }
  }

  Future<Map<String, dynamic>> getCurrentUser() async {
    try {
      final response = await _dio.get('api/users/me');

      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Ошибка регистрации: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Ошибка регистрации: $e');
    }
  }

  Future<Map<String, dynamic>> refreshToken(String refreshToken) async {
    try {
      final response = await _dio.get('api/auth/token/refresh');

      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Ошибка регистрации: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Ошибка регистрации: $e');
    }
  }
}
