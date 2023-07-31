import 'package:flutter/material.dart';

class NavigationService {
  static final navigationKey = GlobalKey<NavigatorState>();

  BuildContext? get context => navigationKey.currentContext!;

  void openLogin() {
    Navigator.pushReplacementNamed(context!, '/login');
  }

  void openDashboard() {
    Navigator.pushReplacementNamed(context!, '/dashboard');
  }

  void openCreateCategory() {
    Navigator.pushNamed(context!, '/create-category');
  }
}
