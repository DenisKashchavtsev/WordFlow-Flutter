import 'package:flutter/material.dart';

import '../../../configs/styles.dart';

class TextButtonWrapper extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;

  const TextButtonWrapper({Key? key, this.onPressed, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: Styles.buttonTextStyles,
      child: child,
    );
  }
}
