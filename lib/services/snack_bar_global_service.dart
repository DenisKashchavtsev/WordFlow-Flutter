import 'package:flutter/material.dart';

class SnackBarGlobalService {
  static GlobalKey<ScaffoldMessengerState> key =
  GlobalKey<ScaffoldMessengerState>();

  static void show(String message) {
    key.currentState!
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(message)));
  }
}