import 'package:flutter/material.dart';

import 'login_app_bar.dart';
import 'login_form.dart';
import 'login_header.dart';

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
