import 'package:flutter/material.dart';

class NavigationService {
  static const dashboardHomeTab = 0;
  static const dashboardLearningTab = 1;
  static const dashboardSettingTab = 2;

  static final navigationKey = GlobalKey<NavigatorState>();

  BuildContext? get context => navigationKey.currentContext!;

  void openLogin() {
    Navigator.pushNamed(context!, '/login');
  }

  void openRegistration() {
    Navigator.pushNamed(context!, '/registration');
  }

  void openDashboard({selectedIndex = 0}) {
    Navigator.pushNamed(context!, '/dashboard', arguments: {
      'selectedIndex': selectedIndex,
    });
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

  void openSteps(String categoryId) {
    Navigator.pushNamed(context!, '/steps', arguments: {
      'categoryId': categoryId,
    });
  }

}
