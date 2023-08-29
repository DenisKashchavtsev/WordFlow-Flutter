import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../configs/styles.dart';
import '../../cubits/category/category_cubit.dart';
import '../../cubits/word/word_cubit.dart';
import '../../services/navigation_service.dart';
import '../widgets/wrappers/text_button_wrapper.dart';

class CategoryWords extends StatefulWidget {
  const CategoryWords({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CategoryWords();
}

class _CategoryWords extends State<CategoryWords> {
  final _scrollController = ScrollController();
  late List<bool> _isChecked = [];

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_pagination);
  }

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;

    context.read<CategoryCubit>().getOne(arguments['categoryId']);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Words',
                style: Styles.textHeaderCommon,
              ),
              BlocBuilder<CategoryCubit, CategoryState>(
                  builder: (context, state) {
                if (_isChecked.contains(true) && state is CategoryStateLoaded) {
                  List selectedWordIds = [];
                  if (state.words.isNotEmpty) {
                    for (int i = 0; i < _isChecked.length; i++) {
                      if (_isChecked.isNotEmpty && _isChecked[i]) {
                        selectedWordIds.add(state.words[i].id);
                      }
                    }

                    return SizedBox(
                        height: 28,
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: (selectedWordIds.length == 1)
                                  ? () async => {
                                        NavigationService().openUpdateWord(
                                            selectedWordIds.first)
                                      }
                                  : null,
                              icon: const Icon(Icons.edit),
                              color: Styles.colorMain,
                            ),
                            IconButton(
                              onPressed: () async => {
                                await context
                                    .read<WordCubit>()
                                    .delete(selectedWordIds),
                                await context
                                    .read<CategoryCubit>()
                                    .getOne(arguments['categoryId']),
                                _isChecked =
                                    List<bool>.filled(state.words.length, false)
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
                    NavigationService().openCreateWord(arguments['categoryId']);
                  },
                  child: const Text('Add word +'),
                );
              })
            ],
          ),
        ),
        Expanded(
          child: BlocBuilder<CategoryCubit, CategoryState>(
            builder: (context, state) {
              if (state is CategoryStateLoaded) {
                if (_isChecked.isEmpty) {
                  _isChecked = List<bool>.filled(state.words.length, false);
                }

                return ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: state.words.length,
                  controller: _scrollController,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25.0, vertical: 5),
                      decoration: Styles.boxDecorationListBuilderWhite,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                value: _isChecked[index],
                                onChanged: (bool? value) {
                                  setState(() {
                                    _isChecked[index] = value!;
                                  });
                                },
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 15),
                                child: Text(state.words[index].source,
                                    style: Styles.textCommon14),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(state.words[index].translate,
                                    style: Styles.textCommon14),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                );
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

      if (state is CategoryStateLoaded) {
        final arguments = (ModalRoute.of(context)?.settings.arguments ??
            <String, dynamic>{}) as Map;
        context.read<CategoryCubit>().getCategoryWords(
            id: arguments['categoryId'], page: ((state.page ?? 1) + 1));

        _isChecked = List<bool>.filled(state.words.length, false);
      }
    }
  }
}
