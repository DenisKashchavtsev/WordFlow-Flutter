import 'package:flutter/material.dart';

import 'widgets/login_app_bar.dart';
import 'widgets/login_form.dart';
import 'widgets/login_header.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const LoginAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [const LoginHeader(), LoginForm()],
        ),
      ),
    );
  }
}
