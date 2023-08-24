import 'dart:convert';

import 'package:dio/dio.dart';

import '../../http/dio_client.dart';
import '../../models/word_word.dart';

class WordService {
  Dio get _dio => DioClient().getClient();

  Future<Map<String, dynamic>> create(String categoryId, String source, String translate) async {
    try {
      final response = await _dio.post('/api/words', data: {
        'categoryId': categoryId,
        'source': source,
        'translate': translate,
      });

      return response.data;
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<Map<String, dynamic>> update(String id, String source, String translate) async {
    try {
      final response = await _dio.put('/api/words/$id', data: {
        'source': source,
        'translate': translate,
      });

      return response.data;
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<WordWord> show(String id) async {
    try {
      final response = await _dio.get('/api/word-words/$id');

      return WordWord(
        id: response.data['id'],
        source: response.data['source'],
        translate: response.data['translate'] ?? '',
      );
    } catch (e) {
      throw Exception('Error getting data: $e');
    }
  }

  Future delete(List ids) async {
    try {
      await _dio.delete('/api/words', data: {
        'ids': ids
      });
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
