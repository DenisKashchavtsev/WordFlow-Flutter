import 'package:flutter/material.dart';

import 'widgets/home_header.dart';
import 'widgets/home_popular_categories.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: const [
            HomeHeader(),
            HomePopularCategories()
          ],
        ),
      ),
    );
  }

}