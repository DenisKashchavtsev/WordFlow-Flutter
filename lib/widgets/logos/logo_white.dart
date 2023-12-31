import 'package:flutter/material.dart';

import '../../../configs/styles.dart';

class LogoWhite extends StatelessWidget {
  const LogoWhite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          'assets/images/logo.png',
          width: 36,
          height: 36,
        ),
        Text(
          'WordFlow',
          style: Styles.textLogoWhite,
        )
      ],
    );
  }
}
