import 'package:flutter/material.dart';

class Styles {
  static const colorMain = Color(0xffF9AD2B);
  static const colorBody = Colors.white;
  static const colorTextLogo = Color(0xFF4B4B4B);
  static const colorTextCommon = Color(0xFF787878);
  static const colorBorderCommon = Color(0xFFBCBCBC);

  /// Buttons
  static ButtonStyle buttonTransparentStyles = ElevatedButton.styleFrom(
      primary: Colors.transparent,
      textStyle: const TextStyle(color: Colors.black));

  static ButtonStyle buttonFilledStyles = ElevatedButton.styleFrom(
    primary: Styles.colorMain,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
    ),
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 23),
    textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    shadowColor: colorMain,
    elevation: 10.0,
  );

  static ButtonStyle buttonStyles = ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      primary: Colors.white,
      side: const BorderSide(
        width: 2,
        color: Styles.colorMain,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      textStyle: const TextStyle(
        fontSize: 20,
      ));

  /// TextButton
  static ButtonStyle buttonTextStyles = TextButton.styleFrom(
    primary: colorMain,
    textStyle: const TextStyle(
        fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),
  );

  /// Inputs
  static OutlineInputBorder inputBorder = const OutlineInputBorder(
      //Outline border type for TextFiled
      borderRadius: BorderRadius.all(Radius.circular(15)),
      borderSide: BorderSide(
        color: Colors.black38,
      ));

  static OutlineInputBorder focusBorder = const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(15)),
      borderSide: BorderSide(
        color: Styles.colorMain,
      ));

  /// Text
  static TextStyle textLogo = const TextStyle(
      color: colorTextLogo,
      fontWeight: FontWeight.bold,
      fontFamily: 'JakartaSans',
      fontSize: 25);
  static TextStyle textLogoWhite = const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontFamily: 'JakartaSans',
      fontSize: 25);
  static TextStyle textHeader = const TextStyle(
    color: colorMain,
    fontWeight: FontWeight.bold,
    fontSize: 25,
    fontFamily: 'JakartaSans',
  );
  static TextStyle textCommon = const TextStyle(
    color: colorTextCommon,
    fontFamily: 'JakartaSans',
    fontSize: 16,
  );
  static TextStyle textCommon14 = const TextStyle(
    color: colorTextCommon,
    fontFamily: 'JakartaSans',
    fontSize: 14,
    fontWeight: FontWeight.w200,
  );
  static TextStyle textCommon12 = const TextStyle(
    color: colorTextCommon,
    fontFamily: 'JakartaSans',
    fontSize: 12,
    fontWeight: FontWeight.w100,
  );
  static TextStyle textHeaderCommon = const TextStyle(
      color: colorTextCommon,
      fontFamily: 'JakartaSans',
      fontSize: 18,
      fontWeight: FontWeight.bold);
  static TextStyle textHeaderWhite = const TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 20,
    fontFamily: 'JakartaSans',
  );
  static TextStyle textCommonWhite = const TextStyle(
    color: Colors.white,
    fontFamily: 'JakartaSans',
    fontSize: 16,
  );

  /// BoxDecoration
  static BoxDecoration boxDecorationCommon = BoxDecoration(
    gradient: const LinearGradient(
      colors: [Color(0x90F9AD2B), colorMain],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    borderRadius: BorderRadius.circular(45),
  );

  /// BoxDecoration ListBuilderItem
  static BoxDecoration boxDecorationListBuilder = BoxDecoration(
    gradient: const LinearGradient(
      colors: [Color(0x90F9AD2B), colorMain],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    borderRadius: BorderRadius.circular(15),
  );

  /// BoxDecoration ListBuilderItemWhite
  static BoxDecoration boxDecorationListBuilderWhite = BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      border: Border.all(
        color: colorBorderCommon,
      ));
}
