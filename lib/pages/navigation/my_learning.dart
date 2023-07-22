import 'package:flutter/material.dart';

import '../../configs/styles.dart';

class MyLearning extends StatelessWidget {
  const MyLearning({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:  [
                            Text(
                              'My categories',
                              style: TextStyle(fontSize: 20),
                            ),
                            ElevatedButton(onPressed: () {},
                                child: Text('Add new +'), style: Styles.buttonTransparentStyles,)
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 1000.0,
                        child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              // Количество элементов в строке
                              crossAxisSpacing: 8.0,
                              // Пространство между элементами по горизонтали
                              mainAxisSpacing:
                                  8.0, // Пространство между элементами по вертикали
                            ),
                            itemCount: 30,
                            // Количество элементов в списке
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  decoration: const BoxDecoration(
                                      color: Styles.mainColor,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  child: Center(
                                    child: Text(
                                      'My set #${index + 1}',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16.0),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
