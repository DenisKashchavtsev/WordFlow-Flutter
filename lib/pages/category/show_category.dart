import 'package:flutter/material.dart';

import 'widgets/category_header.dart';
import 'category_words.dart';

class ShowCategory extends StatelessWidget {
  const ShowCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          CategoryHeader(),
          Expanded(child: CategoryWords()),
        ],
      ),
    );
  }
}
