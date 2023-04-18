import 'package:flutter/material.dart';
import '../dummy_data/dummy_data.dart';
import '../widgets/category_item.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: GridView(
        // ignore: sort_child_properties_last
        children: DUMMY_CATEGORIES
            .map((catData) => CategoryItem(
                title: catData.title, color: catData.color, id: catData.id))
            .toList(),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
      ),
    );
  }
}
