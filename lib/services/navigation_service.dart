import 'package:flutter/material.dart';

class NavigationService {
  static final navigationKey = GlobalKey<NavigatorState>();

  BuildContext? get context => navigationKey.currentContext!;

  void openLogin() {
    Navigator.pushReplacementNamed(context!, '/login');
  }

  void openRegistration() {
    Navigator.pushReplacementNamed(context!, '/registration');
  }

  void openDashboard() {
    Navigator.pushReplacementNamed(context!, '/dashboard');
  }

  void openCreateCategory() {
    Navigator.pushNamed(context!, '/create-category');
  }

  void openUpdateCategory(String categoryId) {
    Navigator.pushNamed(context!, '/update-category', arguments: {
      'categoryId': categoryId,
    });
  }

  void openShowCategory(String categoryId) {
    Navigator.pushNamed(context!, '/show-category', arguments: {
      'categoryId': categoryId
    });
  }

  void openCreateWord(String categoryId) {
    Navigator.pushNamed(context!, '/create-word', arguments: {
      'categoryId': categoryId
    });
  }

  void openUpdateWord(String wordId) {
    Navigator.pushNamed(context!, '/update-word', arguments: {
      'wordId': wordId,
    });
  }

  void back() {
    Navigator.pop(context!);
  }
}
