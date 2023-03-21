import 'package:flutter/material.dart';
import 'main.dart';
import './categoryScreen.dart';

class Pages extends StatefulWidget {
  @override
  State<Pages> createState() => _PagesState();
}

class _PagesState extends State<Pages> {
  int currentIndex = 0;

  final screenPages = [
    Center(
      child: Home(),
    ),
    const Center(
      child: Category(),
    ),
    const Center(
      child: (Text('working')),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: screenPages[currentIndex],
          bottomNavigationBar: BottomNavigationBar(
              elevation: 10,
              currentIndex: currentIndex,
              onTap: (index) => setState(() => currentIndex = index),
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.white24,
              selectedItemColor: Colors.teal,
              unselectedItemColor: Colors.white,
              iconSize: 30,
              selectedFontSize: 20,
              unselectedFontSize: 15,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.category_rounded),
                  label: 'Category',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite),
                  label: 'Favorite',
                ),
              ])),
    );
  }
}
