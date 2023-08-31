import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubits/word/word_cubit.dart';
import 'word_form.dart';
import 'word_header.dart';

class UpdateWord extends StatelessWidget {
  const UpdateWord({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;

    context.read<WordCubit>().getOne(arguments['wordId']);

    return Scaffold(
      body: Column(
        children: [
          const WordHeader(),
          BlocBuilder<WordCubit, WordState>(
            builder: (context, state) {
              if (state is WordStateLoaded) {
                return WordForm(
                    id: state.word.id,
                    source: state.word.source,
                    translate: state.word.translate);
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
