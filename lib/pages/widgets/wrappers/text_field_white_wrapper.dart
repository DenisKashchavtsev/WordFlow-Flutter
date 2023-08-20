import 'package:flutter/material.dart';

import '../../../configs/styles.dart';

class TextFieldWhiteWrapper extends StatelessWidget {
  final String hintText;
  final IconData? prefixIcon;
  final TextEditingController controller;

  const TextFieldWhiteWrapper({
    required this.hintText,
    required this.prefixIcon,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(
              color: Colors.white,
            )),
        focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(
              color: Colors.white,
            )),
        hintText: hintText,
        iconColor: Styles.colorMain,
        prefixIcon: Icon(
          prefixIcon,
          size: 20,
          color: Styles.colorTextCommon,
        ),
        filled: true,
        fillColor: Colors.white,
      ),
      controller: controller,
    );
  }
}
