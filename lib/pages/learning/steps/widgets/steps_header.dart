import 'package:flutter/material.dart';

import '../../../../services/navigation_service.dart';
import '../../../../widgets/logos/logo.dart';

class StepsHeader extends StatelessWidget {
  const StepsHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(onPressed: () {
            NavigationService().back();
          }, iconSize: 40, icon: Image.asset('assets/images/btn/back.png')),
          const Logo(),
        ],
      ),
    );
  }
}
