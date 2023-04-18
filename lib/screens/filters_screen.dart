import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen(
      {super.key, required this.saveFilters, required this.currentFilters});
  static const routeName = '/filters';
  final Function saveFilters;
  final Map<String, bool> currentFilters;

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool isGlutenFree = false;
  bool isVegan = false;
  bool isVegetarian = false;
  bool isLactoseFree = false;
  @override
  void initState() {
    isGlutenFree = widget.currentFilters['isGlutenFree']!;
    isVegan = widget.currentFilters['isVegan']!;
    isVegetarian = widget.currentFilters['isVegetarian']!;
    isLactoseFree = widget.currentFilters['isLactoseFree']!;
    super.initState();
  }

  Widget builSwitchListTail(String title, String subTitle, bool value,
      Function(bool val) updateValue) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subTitle),
      value: value,
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Filters'),
          actions: [
            IconButton(
                icon: const Icon(Icons.save),
                onPressed: () {
                  final selectedFilters = {
                    'isGlutenFree': isGlutenFree,
                    'isVegan': isVegan,
                    'isVegetarian': isVegetarian,
                    'isLactoseFree': isLactoseFree
                  };
                  widget.saveFilters(selectedFilters);
                })
          ],
        ),
        drawer: const MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              child: Text(
                'Adjust your filters',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            Expanded(
                child: ListView(
              children: [
                builSwitchListTail(
                    'Gluten Free', 'Completely free of Gluten', isGlutenFree,
                    (val) {
                  setState(() {
                    isGlutenFree = val;
                  });
                }),
                builSwitchListTail('Vegan', 'It is completely Vegan', isVegan,
                    (val) {
                  setState(() {
                    isVegan = val;
                  });
                }),
                builSwitchListTail(
                    'Vegetarian', 'Is is completely Vegetarian', isVegetarian,
                    (val) {
                  setState(() {
                    isVegetarian = val;
                  });
                }),
                builSwitchListTail(
                    'Lactose Free', 'Is contains 0% Lactose', isLactoseFree,
                    (val) {
                  setState(() {
                    isLactoseFree = val;
                  });
                }),
              ],
            ))
          ],
        ));
  }
}
