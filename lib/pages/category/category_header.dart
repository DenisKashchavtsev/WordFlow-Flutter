import 'package:flutter/material.dart';

import '../../configs/styles.dart';
import '../../services/navigation_service.dart';
import '../widgets/logos/logo.dart';
import '../widgets/wrappers/text_button_wrapper.dart';

class CategoryHeader extends StatelessWidget {
  const CategoryHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(onPressed: () {
            Navigator.pop(context);
          }, iconSize: 40, icon: Image.asset('images/btn/back.png')),
          const Logo(),
        ],
      ),
    );
  }
}
