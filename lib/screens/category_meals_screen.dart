// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:meals_app/widgets/meal_item.dart';
import '../dummy_data/dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  const CategoryMealsScreen({super.key});
  static const routeName = '/category_meals';

  @override
  Widget build(BuildContext context) {
    final routArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final catTitle = routArgs['title'];
    final catId = routArgs['id'];
    final categoryMeals = DUMMY_MEALS.where(
      (meal) {
        return meal.categories.contains(catId);
      },
    ).toList();

    return Scaffold(
        appBar: AppBar(
          title: Text(catTitle!),
        ),
        body: ListView.builder(
            itemCount: categoryMeals.length,
            itemBuilder: (context, index) {
              return MealItem(
                  id: categoryMeals[index].id,
                  affordability: categoryMeals[index].affordability,
                  complexity: categoryMeals[index].complexity,
                  duration: categoryMeals[index].duration,
                  imageUrl: categoryMeals[index].imageUrl,
                  title: categoryMeals[index].title);
            }));
  }
}
