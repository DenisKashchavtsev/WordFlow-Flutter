import 'package:flutter/material.dart';

import 'widgets/learning_categories.dart';
import 'widgets/learning_header.dart';

class Learning extends StatelessWidget {
  const Learning({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: const [
          LearningHeader(),
          Expanded(child: LearningCategories())
        ],
      ),
    );
  }
}
