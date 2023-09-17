import 'package:flutter/material.dart';

import 'widgets/register_app_bar.dart';
import 'widgets/register_form.dart';
import 'widgets/register_header.dart';

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const RegisterAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const RegisterHeader(),
            RegisterForm(),
          ],
        ),
      ),
    );
  }
}
