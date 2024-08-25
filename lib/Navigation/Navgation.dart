import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/Navigation/CategoriesScreen.dart';
import 'package:flutter_project/Navigation/ProfileScreen.dart';
import 'package:flutter_project/Navigation/SettingsScreen.dart';

class NavigatorMain extends StatefulWidget{
  @override
  _NavigatorMain createState() => _NavigatorMain();

}

class _NavigatorMain extends State<NavigatorMain>{
  int _selectedIndex = 0 ;

  final List<Widget> _screen = [
    CategoriesScreen(),
    ProfileScreen(),
    SettingsScreen()
  ];

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screen[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.orange,
          unselectedItemColor: Colors.grey.shade200,

          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined),
              label: "Categories"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "Profile"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: "Settings"
            )
          ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),

    );
  }
}