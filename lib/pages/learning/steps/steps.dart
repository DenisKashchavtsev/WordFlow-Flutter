import 'package:flutter/material.dart';

import 'widgets/steps_header.dart';
import 'widgets/steps_webview.dart';

class Steps extends StatelessWidget {
  const Steps({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          Container(color: Colors.white, child: const StepsHeader()),
          Expanded(child: StepsWebView(categoryId: arguments['categoryId']))
        ],
      ),
    );
  }
}
