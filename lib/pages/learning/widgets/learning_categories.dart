import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../configs/styles.dart';
import '../../../cubits/category/category_cubit.dart';
import '../../../models/word_category.dart';
import '../../../services/navigation_service.dart';
import '../../../widgets/wrappers/text_button_wrapper.dart';

class LearningCategories extends StatefulWidget {
  const LearningCategories({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LearningCategories();
}

class _LearningCategories extends State<LearningCategories> {
  final _scrollController = ScrollController();
  late List<bool> _isChecked = [];

  @override
  void initState() {
    _scrollController.addListener(_pagination);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Learning',
                style: Styles.textHeaderCommon,
              ),
              BlocBuilder<CategoryCubit, CategoryState>(
                  builder: (context, state) {
                if (_isChecked.contains(true) &&
                    state is CategoriesStateLoaded) {
                  List selectedCategoriesIds = [];
                  if (state.categories.isNotEmpty) {
                    for (int i = 0; i < _isChecked.length; i++) {
                      if (_isChecked.isNotEmpty && _isChecked[i]) {
                        selectedCategoriesIds.add(state.categories[i].id);
                      }
                    }

                    return SizedBox(
                        height: 28,
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: (selectedCategoriesIds.length == 1)
                                  ? () async => {
                                        NavigationService().openUpdateCategory(
                                            selectedCategoriesIds.first)
                                      }
                                  : null,
                              icon: const Icon(Icons.edit),
                              color: Styles.colorMain,
                            ),
                            IconButton(
                              onPressed: () async => {
                                await context
                                    .read<CategoryCubit>()
                                    .delete(selectedCategoriesIds),
                                await context.read<CategoryCubit>().getList(),
                                _isChecked = List<bool>.filled(
                                    state.categories.length, false)
                              },
                              icon: const Icon(Icons.delete_outline),
                              color: Styles.colorMain,
                            ),
                          ],
                        ));
                  }
                }

                return TextButtonWrapper(
                  onPressed: () {
                    NavigationService().openCreateCategory();
                  },
                  child: const Text('Add category +'),
                );
              })
            ],
          ),
        ),
        Expanded(
          child: BlocBuilder<CategoryCubit, CategoryState>(
            builder: (context, state) {
              if (state is CategoriesStateLoaded) {
                List<WordCategory> categories = state.categories;

                if (_isChecked.isEmpty) {
                  _isChecked = List<bool>.filled(categories.length, false);
                }

                return ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: categories.length,
                  controller: _scrollController,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 5),
                      decoration: Styles.boxDecorationListBuilderWhite,
                      child: GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          print('tap');
                          NavigationService()
                              .openShowCategory(categories[index].id);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 10.0),
                                  child: Checkbox(
                                    value: _isChecked[index],
                                    onChanged: (bool? value) {
                                      setState(() {
                                        _isChecked[index] = value!;
                                      });
                                    },
                                  ),
                                ),
                                CachedNetworkImage(
                                  imageUrl: categories[index].image.isNotEmpty
                                      ? categories[index].image
                                      : 'https://via.placeholder.com/40x40',
                                  placeholder: (context, url) => const CircularProgressIndicator(),
                                  errorWidget: (context, url, error) => const Icon(Icons.error),
                                  width: 40,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(categories[index].name,
                                      style: Styles.textCommon14),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  '84%',
                                  style: Styles.textCommon12,
                                ),
                                IconButton(
                                    onPressed: () {
                                      NavigationService().openSteps(categories[index].id);
                                    },
                                    iconSize: 40,
                                    splashRadius: 5,
                                    icon: Image.asset(
                                        'assets/images/btn/btn_start.png')),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              } else if (state is CategoriesStateEmpty) {
                return const Text('empty');
              }

              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        )
      ],
    );
  }

  void _pagination() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      final state = context.read<CategoryCubit>().state;

      if (state is CategoriesStateLoaded) {
        context.read<CategoryCubit>().getList(page: ((state.page ?? 1) + 1));
      }
    }
  }
}
