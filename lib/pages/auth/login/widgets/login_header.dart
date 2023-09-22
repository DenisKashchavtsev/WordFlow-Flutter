import 'package:flutter/material.dart';

import '../../../../configs/styles.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 30, 15, 5),
          child: Text(
            'Welcome back!',
            style: Styles.textHeader,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
          child: Text(
            'Nice to see you back, you can log in and continue your learning progress',
            style: Styles.textCommon,
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}
