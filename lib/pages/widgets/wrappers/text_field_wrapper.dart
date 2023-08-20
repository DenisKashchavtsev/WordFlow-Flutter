import 'package:flutter/material.dart';

import '../../../configs/styles.dart';

class TextFieldWrapper extends StatelessWidget {
  final String hintText;
  final IconData? prefixIcon;
  final TextEditingController controller;

  const TextFieldWrapper({
    required this.hintText,
    this.prefixIcon,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        enabledBorder: Styles.inputBorder,
        focusedBorder: Styles.focusBorder,
        hintText: hintText,
        iconColor: Styles.colorMain,
        prefixIcon: Icon(prefixIcon, size: 20, color: Styles.colorTextCommon,),
        filled: true,
        fillColor: Colors.white,
      ),
      controller: controller,
    );
  }
}