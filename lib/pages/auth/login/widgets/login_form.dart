import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../configs/styles.dart';
import '../../../../cubits/auth/token/token_cubit.dart';
import '../../../../cubits/user/user_cubit.dart';
import '../../../../widgets/wrappers/elevated_button_wrapper.dart';
import '../../../../widgets/wrappers/text_field_wrapper.dart';

class LoginForm extends StatelessWidget {
  LoginForm({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    _emailController.text = 'test@gmail.com';
    _passwordController.text = '1234';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        BlocBuilder<TokenCubit, TokenState>(
          builder: (context, state) {

            if (state is TokenStateLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return const SizedBox.shrink();
          },
        ),
        Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextFieldWrapper(
                      controller: _emailController,
                      prefixIcon: Icons.mail_outline,
                      hintText: 'Email',
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextFieldWrapper(
                      controller: _passwordController, prefixIcon: Icons.lock_outline_rounded, hintText: 'Password',
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: ElevatedButtonWrapper(
                        onPressed: () {
                          context.read<TokenCubit>().getToken(
                              _emailController.text, _passwordController.text);
                        },
                        child: const Text('Login')),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
