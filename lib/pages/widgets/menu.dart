import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../configs/styles.dart';
import '../../cubits/user/user_cubit.dart';
import '../../services/navigation_service.dart';


class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  String _userName = '';
  String _userEmail = '';

  @override
  void initState() {
    super.initState();
    _loadUserName();
  }

  Future<void> _loadUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userName = prefs.getString('user.name') ?? '';
    String userEmail = prefs.getString('user.email') ?? '';
    setState(() {
      _userName = userName;
      _userEmail = userEmail;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          BlocBuilder<UserCubit, UserState>(
            builder: (context, state) {
              return UserAccountsDrawerHeader(
                accountName: Text(_userName),
                accountEmail: Text(_userEmail),
                decoration: const BoxDecoration(
                  color: Styles.mainColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40.0),
                    bottomRight: Radius.circular(40.0),
                  ),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.favorite),
            title: const Text('Create category'),
            onTap: () => NavigationService().openCreateCategory(),
          ),
          const ListTile(
            leading: Icon(Icons.person),
            title: Text('asfdasdf'),
            // onTap: () => null,
          ),
        ],
      ),
    );
  }
}
