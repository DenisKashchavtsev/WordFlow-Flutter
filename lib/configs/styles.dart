import 'package:flutter/material.dart';

class Styles {
  static const mainColor = Color(0xffe3864c);
  static const bodyColor = Color(0xFFEEECEC);

  /// Buttons
  static ButtonStyle buttonTransparentStyles = ElevatedButton.styleFrom(
      primary: Colors.transparent,
      textStyle: const TextStyle(
        color: Colors.black
      ));
  static ButtonStyle buttonFilledStyles = ElevatedButton.styleFrom(
      primary: Styles.mainColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      textStyle: const TextStyle(
        fontSize: 20,
      ));
  static ButtonStyle buttonStyles = ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      primary: Colors.white,
      side: const BorderSide(
        width: 2,
        color: Styles.mainColor,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      textStyle: const TextStyle(
        fontSize: 20,
      ));

  /// Inputs
  static OutlineInputBorder inputBorder = const OutlineInputBorder(
      //Outline border type for TextFiled
      borderRadius: BorderRadius.all(Radius.circular(20)),
      borderSide: BorderSide(
        color: Colors.black38,
      ));

  static OutlineInputBorder focusBorder = const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      borderSide: BorderSide(
        color: Styles.mainColor,
      ));
}
