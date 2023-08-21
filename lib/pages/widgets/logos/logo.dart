import 'package:flutter/material.dart';

import '../../../configs/styles.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          'images/logo.png',
          width: 36,
          height: 36,
        ),
        Text(
          'WordFlow',
          style: Styles.textLogo,
        )
      ],
    );
  }
}
