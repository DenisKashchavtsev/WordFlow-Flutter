import 'package:flutter/material.dart';

import '../widgets/learning_header.dart';

class MatchTranslationStep extends StatelessWidget {
  const MatchTranslationStep({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: const [
          LearningHeader(),
          // Expanded(child: )
        ],
      ),
    );
  }
}
