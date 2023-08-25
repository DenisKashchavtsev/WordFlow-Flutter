import 'services/api/category_service.dart';

import 'services/api/auth_service.dart';
import 'services/api/word_service.dart';

class ServiceLocator {
  AuthService get authService => AuthService();
  CategoryService get categoryService => CategoryService();
  WordService get wordService => WordService();
}