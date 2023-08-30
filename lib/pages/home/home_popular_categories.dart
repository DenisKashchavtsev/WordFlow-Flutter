import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../configs/styles.dart';
import '../../cubits/category/category_cubit.dart';
import '../../cubits/user/user_cubit.dart';
import '../widgets/logos/logo_white.dart';
import '../widgets/wrappers/elevated_button_wrapper.dart';
import '../widgets/wrappers/text_button_wrapper.dart';
import '../widgets/wrappers/text_field_white_wrapper.dart';

class HomePopularCategories extends StatelessWidget {
  const HomePopularCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Popular categories', style: Styles.textHeaderCommon,),
              TextButtonWrapper(
                onPressed: () {},
                child: const Text('See all'),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 1000.0,
          child: GridView.builder(
              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemCount: 6,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Styles.colorMain,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Center(
                      child: Text(
                        'Popular set #${index + 1}',
                        style: const TextStyle(
                            color: Colors.white, fontSize: 16.0),
                      ),
                    ),
                  ),
                );
              }),
        ),
        ElevatedButton(
            onPressed: () {
              context.read<CategoryCubit>().getList();
            },
            child: const Text('get chats')),
        ElevatedButton(
            onPressed: () {
              context.read<UserCubit>().getCurrentUser();
            },
            child: const Text('get me')),
      ],
    );
  }
}
