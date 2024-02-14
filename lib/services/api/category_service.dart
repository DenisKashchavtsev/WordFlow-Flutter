import 'dart:convert';

import 'package:dio/dio.dart';

import '../../http/dio_client.dart';
import '../../models/word_category.dart';
import '../../models/word_word.dart';

class CategoryService {
  Dio get _dio => DioClient().getClient();

  Future<List<WordCategory>> getList(int page) async {
    try {
      final response = await _dio.get('word-categories?page=$page');

      if (jsonDecode(response.data)['data'] is List) {
        List<WordCategory> categoryList =
            (jsonDecode(response.data)['data'] as List).map((item) {
          return WordCategory(
            id: item['id'],
            name: item['name'],
            image: item['image'],
            public: item['public'],
          );
        }).toList();

        return categoryList;
      } else {
        return [];
      }
    } catch (e) {
      throw Exception('Error getting data: $e');
    }
  }

  Future<Map<String, dynamic>> create(String name) async {
    try {
      final response = await _dio.post('word-categories', data: {
        'name': name,
      });

      return response.data;
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<Map<String, dynamic>> update(String id, String name) async {
    try {
      final response = await _dio.put('word-categories/$id', data: {
        'name': name,
      });

      return response.data;
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<WordCategory> show(String id) async {
    try {
      final response = await _dio.get('word-categories/$id');

      return WordCategory(
        id: response.data['id'],
        name: response.data['name'],
        image: response.data['image'] ?? '',
        public: response.data['public'] ?? false,
      );
    } catch (e) {
      throw Exception('Error getting data: $e');
    }
  }

  Future<List<WordWord>> getCategoryWords(String id, int page) async {
    try {
      final response = await _dio.get('word-categories/$id/words');
      final data = jsonDecode(response.data)['data'];
      if (data is List) {
        List<WordWord> wordList = (data).map((item) {
          return WordWord(
            id: item['id'],
            translate: item['translate'],
            source: item['source'],
          );
        }).toList();

        print(wordList);
        return wordList;
      } else {
        return [];
      }
    } catch (e) {
      throw Exception('Error getting data: $e');
    }
  }

  Future delete(List ids) async {
    try {
      await _dio.delete('word-categories', data: {
        'ids': ids
      });
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
