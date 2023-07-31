import 'services/auth_service.dart';

class ServiceLocator {
  AuthService get authService => AuthService();
}