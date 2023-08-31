import 'package:flutter/material.dart';
import 'word_form.dart';
import 'word_header.dart';

class CreateWord extends StatelessWidget {
  const CreateWord({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const WordHeader(),
          WordForm(),
        ],
      ),
    );
  }
}
