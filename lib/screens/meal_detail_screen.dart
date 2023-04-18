// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({super.key});
  static const routeName = '/meal_details';

  Widget buildTitle(BuildContext context, String title) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Text(title, style: Theme.of(context).textTheme.titleMedium));
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedMeal =
        DUMMY_MEALS.firstWhere((element) => element.id == mealId);
    return Scaffold(
        appBar: AppBar(
          title: Text(selectedMeal.title),
        ),
        body: Column(
          children: [
            Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(6)),
              height: 280,
              width: double.infinity,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Image.network(selectedMeal.imageUrl)),
            ),
            buildTitle(context, 'Ingridemts'),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
              height: 240,
              width: double.infinity,
              child: ListView.builder(
                itemCount: selectedMeal.ingredients.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Theme.of(context).accentColor,
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Text(selectedMeal.ingredients[index]),
                    ),
                  );
                },
              ),
            ),
            buildTitle(context, 'Steps')
          ],
        ));
  }
}
