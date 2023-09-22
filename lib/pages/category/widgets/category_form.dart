import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../cubits/category/category_cubit.dart';
import '../../widgets/wrappers/elevated_button_wrapper.dart';
import '../../widgets/wrappers/text_field_wrapper.dart';

class CategoryForm extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final ImagePicker _imagePicker = ImagePicker();
  final String? name;
  final String? id;

  void selectImage() async {
    final pickedImage =
        await _imagePicker.getImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      print(pickedImage);
    }
  }

  CategoryForm({Key? key, this.name, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    if (name != null) {
      _nameController.text = name!;
    }

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
                          controller: _nameController,
                          prefixIcon: null,
                          hintText: 'Name category',
                        ),
                      ),
                    ],
                  ),
                ),

                // Image.file(, height: 200),

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
                                context
                                    .read<CategoryCubit>()
                                    .update(id, _nameController.text);
                              } else {
                                context
                                    .read<CategoryCubit>()
                                    .create(_nameController.text);
                              }
                            },
                            child: const Text('Create')),
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
