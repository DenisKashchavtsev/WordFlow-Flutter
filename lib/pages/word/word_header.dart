import 'package:flutter/material.dart';

import '../../services/navigation_service.dart';
import '../widgets/logos/logo.dart';

class WordHeader extends StatelessWidget {
  const WordHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(onPressed: () {
            NavigationService().openDashboard();
          }, iconSize: 40, icon: Image.asset('images/btn/back.png')),
          const Logo(),
        ],
      ),
    );
  }
}
