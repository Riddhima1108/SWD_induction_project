import 'package:flutter/material.dart';

import './about_me.dart';
import './home.dart';

class NavigationbottomBar extends StatefulWidget {
  NavigationbottomBar({Key? key}) : super(key: key);

  @override
  State<NavigationbottomBar> createState() => _NavigationbottomBarState();
}

class _NavigationbottomBarState extends State<NavigationbottomBar> {
  int _selectedIndex = 0;
  void _navigateBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [Home(), AboutMe()];
  final List<Color> colors = [Colors.purple.shade800, Color(0xFF89dad0)];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _navigateBar,
        selectedItemColor: colors[_selectedIndex],
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'About Me',
          ),
        ],
      ),
    );
  }
}
