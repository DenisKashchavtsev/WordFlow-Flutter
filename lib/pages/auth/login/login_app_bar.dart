import 'package:flutter/material.dart';

import '../../../services/navigation_service.dart';
import '../../widgets/logos/logo.dart';
import '../../widgets/wrappers/text_button_wrapper.dart';

class LoginAppBar extends StatelessWidget implements PreferredSizeWidget {
  const LoginAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Logo(),
      elevation: 0,
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      actions: [
        TextButtonWrapper(
            onPressed: () => NavigationService().openRegistration(),
            child: const Text('Sign up'))
      ],
    );
  }
}
