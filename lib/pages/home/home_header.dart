import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../configs/styles.dart';
import '../widgets/logos/logo_white.dart';
import '../widgets/wrappers/text_field_white_wrapper.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeHeader();
}

class _HomeHeader extends State<HomeHeader> {
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

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(25),
      height: 265,
      decoration: Styles.boxDecorationCommon,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const LogoWhite(),
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 30, 5, 5),
            child: Text(
              'Hello, $_userName',
              style: Styles.textHeaderWhite,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Text(
              'Find the category of words you like here',
              style: Styles.textCommonWhite,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 20, 5, 15),
            child: TextFieldWhiteWrapper(
              controller: _searchController,
              prefixIcon: Icons.search,
              hintText: 'Find category',
            ),
          ),
        ],
      ),
    );
  }
}
