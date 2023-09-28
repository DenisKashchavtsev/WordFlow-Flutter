import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../configs/styles.dart';
import '../../cubits/category/category_cubit.dart';
import 'widgets/category_form.dart';
import 'widgets/category_header.dart';

class CreateCategory extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();

  CreateCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CategoryHeader(),
          CategoryForm(),
        ],
      ),
    );
  }
}
