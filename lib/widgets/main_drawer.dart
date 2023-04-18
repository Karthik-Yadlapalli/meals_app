import 'package:flutter/material.dart';
import 'package:meals_app/screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  Widget buildListTile(String title, IconData icon, dynamic tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 30,
      ),
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.w300, fontSize: 20),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            decoration:
                const BoxDecoration(color: Color.fromARGB(255, 239, 211, 110)),
            child: const Text(
              'Cooking Up!',
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30),
            ),
          ),
          const SizedBox(height: 20),
          buildListTile('Resturants', Icons.restaurant, () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          buildListTile('Filter', Icons.filter_alt_outlined, () {
            Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
          }),
          buildListTile('Settings', Icons.settings, () {}),
        ],
      ),
    );
  }
}
