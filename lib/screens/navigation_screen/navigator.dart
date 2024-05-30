import 'package:flutter/material.dart';
import 'package:project/screens/favorite_screen/favorite.dart';
import 'package:project/screens/home_screen/home.dart';
import 'package:project/screens/search_screens/searchPage.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _selectedIndex = 0;

  List <Widget> _screens = [
    Home(),
    SearchPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: _screens[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favourites',
          ),
        ],
        unselectedItemColor: Color.fromARGB(255, 54, 34, 56),
        selectedItemColor: Colors.white,
        backgroundColor: Color.fromARGB(255, 169, 52, 156),
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        ),
      ),
    );
  }
}