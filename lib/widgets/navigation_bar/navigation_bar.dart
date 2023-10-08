import 'package:flutter/material.dart';

import '../../pages/home/home.dart';
import '../../pages/learning/learning.dart';

class BottomNavigationBarWrapper extends StatefulWidget {
  final int selectedIndex;

  const BottomNavigationBarWrapper(this.selectedIndex, {super.key});

  @override
  State<BottomNavigationBarWrapper> createState() =>
      _BottomNavigationBarWrapperState();
}

class _BottomNavigationBarWrapperState
    extends State<BottomNavigationBarWrapper> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();

    _selectedIndex = widget.selectedIndex;
  }

  static const List<Widget> _widgetOptions = <Widget>[
    Home(),
    Learning(),
    Text(
      'Settings',
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Learning',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
