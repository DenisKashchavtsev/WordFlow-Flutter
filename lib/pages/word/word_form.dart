import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../cubits/word/word_cubit.dart';
import '../../widgets/wrappers/elevated_button_wrapper.dart';
import '../../widgets/wrappers/text_field_wrapper.dart';

class WordForm extends StatelessWidget {
  final TextEditingController _sourceController = TextEditingController();
  final TextEditingController _translateController = TextEditingController();
  final ImagePicker _imagePicker = ImagePicker();
  final String? id;
  final String? source;
  final String? translate;

  void selectImage() async {
    final pickedImage =
        await _imagePicker.getImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      print(pickedImage);
    }
  }

  WordForm({Key? key, this.id, this.source, this.translate}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    if (source != null && translate != null) {
      _sourceController.text = source!;
      _translateController.text = translate!;
    }

    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(45),
          child: Container(
            height: 270,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(40.0))),
            child: Column(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: TextFieldWrapper(
                          controller: _sourceController,
                          hintText: 'Source',
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: TextFieldWrapper(
                          controller: _translateController,
                          hintText: 'Translate',
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ElevatedButtonWrapper(
                            onPressed: () {
                              if (id != null) {
                                context.read<WordCubit>().update(
                                    id!,
                                    _sourceController.text,
                                    _translateController.text);
                              } else {
                                context.read<WordCubit>().create(
                                    arguments['categoryId'],
                                    _sourceController.text,
                                    _translateController.text);
                              }
                            },
                            child: const Text('Save')),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
