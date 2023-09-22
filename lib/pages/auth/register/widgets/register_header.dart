import 'package:flutter/material.dart';

import '../../../../configs/styles.dart';

class RegisterHeader extends StatelessWidget {
  const RegisterHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 30, 15, 5),
          child: Text(
            'Sign up',
            style: Styles.textHeader,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
          child: Text(
            'The point of your journey together is here, start registering now',
            style: Styles.textCommon,
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}
