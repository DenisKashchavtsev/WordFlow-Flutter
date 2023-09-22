import 'package:flutter/material.dart';

import '../../../configs/styles.dart';
import '../../widgets/logos/logo.dart';
import '../../widgets/wrappers/text_button_wrapper.dart';

class LearningHeader extends StatelessWidget {
  const LearningHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Logo(),
        ],
      ),
    );
  }
}
