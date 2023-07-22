import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../configs/styles.dart';
import '../../cubits/category/category_cubit.dart';
import '../../cubits/user/user_cubit.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _Dashboard createState() => _Dashboard();
}

class _Dashboard extends State<Dashboard> {
  String _userName = '';

  @override
  void initState() {
    super.initState();
    _loadUserName();
  }

  Future<void> _loadUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userName = prefs.getString('user.name') ?? '';
    setState(() {
      _userName = userName;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: <Widget>[
                Container(
                  height: 200,
                  decoration: const BoxDecoration(
                      color: Styles.mainColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40.0),
                        bottomRight: Radius.circular(40.0),
                      )),
                ),
                Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 40, horizontal: 45),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Hello, ${_userName}!',
                            style:
                                TextStyle(color: Colors.white, fontSize: 30)),
                        const SizedBox(
                          height: 10,
                        ),
                        Text('We are delighted to welcome you.',
                            style:
                                TextStyle(color: Colors.white, fontSize: 18)),
                      ],
                    )),
                Container(
                  padding: EdgeInsets.fromLTRB(15, 230, 15, 15),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Popular categories', style: TextStyle(fontSize: 20),),
                            ElevatedButton(
                              onPressed: () {},
                              child: Text('See all'),
                              style: Styles.buttonTransparentStyles,
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
                              // Количество элементов в строке
                              crossAxisSpacing: 8.0,
                              // Пространство между элементами по горизонтали
                              mainAxisSpacing:
                                  8.0, // Пространство между элементами по вертикали
                            ),
                            itemCount: 6,
                            // Количество элементов в списке
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  decoration: const BoxDecoration(
                                      color: Styles.mainColor,
                                      borderRadius: BorderRadius.all(Radius.circular(20))),
                                  child: Center(
                                    child: Text(
                                      'Popular set #${index + 1}',
                                      style: TextStyle(
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
