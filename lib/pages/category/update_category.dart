import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../configs/styles.dart';
import '../../cubits/category/category_cubit.dart';
import 'category_form.dart';
import 'category_header.dart';

class UpdateCategory extends StatelessWidget {

  const UpdateCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;

    context.read<CategoryCubit>().getOne(arguments['categoryId']);

    return Scaffold(
      body: Column(
        children: [
          const CategoryHeader(),
          BlocBuilder<CategoryCubit, CategoryState>(
            builder: (context, state) {
              if (state is CategoryStateLoaded) {
                return CategoryForm(
                    id: state.category.id,
                    name: state.category.name);
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          )
          ],
      ),
    );
  }
}
