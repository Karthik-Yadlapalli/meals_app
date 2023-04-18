// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/favourites_screen.dart';
import 'package:meals_app/widgets/main_drawer.dart';

import '../models/meals.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key, required this.favouritMeals});
  final List<Meal>? favouritMeals;
  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  // final List<Map<String, dynamic>> pages = [
  //   {'page': const Categories(), 'title': 'Categories'},
  //   {'page': const FavoritesScreen(), 'title': 'Favorites'}
  // ];

  late List<Widget> pages;

  int selectedIndex = 0;
  @override
  void initState() {
    pages = [
      const Categories(),
      FavoritesScreen(favouritMeals: widget.favouritMeals!)
    ];
    super.initState();
  }

  void _selectedTab(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text(selectedIndex == 0 ? 'Categories' : 'Favorites')),
      drawer: const MainDrawer(),
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).primaryColor,
          currentIndex: selectedIndex,
          selectedItemColor: Theme.of(context).accentColor,
          unselectedItemColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          onTap: _selectedTab,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: 'Favorites',
            )
          ]),
    );
  }
}
