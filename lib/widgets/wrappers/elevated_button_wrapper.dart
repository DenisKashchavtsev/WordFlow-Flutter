import 'package:flutter/material.dart';

import '../../../configs/styles.dart';

class ElevatedButtonWrapper extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget? child;

  const ElevatedButtonWrapper({Key? key, this.onPressed, this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: Styles.buttonFilledStyles,
      child: child,
    );
  }
}
