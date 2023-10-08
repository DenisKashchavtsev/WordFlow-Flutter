import 'package:flutter/material.dart';

import '../widgets/navigation_bar/navigation_bar.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;

    return Scaffold(
      bottomNavigationBar: BottomNavigationBarWrapper(arguments['selectedIndex'] ?? 0),
    );
  }
}
