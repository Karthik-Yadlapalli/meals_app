// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import '../dummy_data/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routename = '/meal-detail';
  final Function toggelFavourits;
  final Function isFavourit;
  const MealDetailScreen(
      {super.key, required this.toggelFavourits, required this.isFavourit});

  @override
  Widget build(BuildContext context) {
    // Route arguments
    final mealId = ModalRoute.of(context)!.settings.arguments as String;

    // Matching the meal id
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    return Scaffold(
      appBar: AppBar(title: Text(selectedMeal.title)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(children: [
              Container(
                height: 300,
                width: double.infinity,
                child: Image.network(
                  selectedMeal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                  bottom: 20,
                  right: 15,
                  child: Container(
                    decoration:
                        BoxDecoration(color: Colors.white.withOpacity(0.2)),
                    child: GestureDetector(
                        onTap: () => toggelFavourits(mealId),
                        child: Icon(Icons.favorite,
                            color: isFavourit(mealId)
                                ? Colors.red
                                : Colors.white)),
                  ))
            ]),
            buildSectionTitle(context, 'Ingredients'),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => Card(
                  color: Theme.of(context).accentColor,
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                      child: Text(selectedMeal.ingredients[index])),
                ),
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            buildSectionTitle(context, 'Steps'),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('# ${index + 1}'),
                      ),
                      title: Text(
                        selectedMeal.steps[index],
                      ),
                    ),
                    const Divider()
                  ],
                ),
                itemCount: selectedMeal.steps.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pop(mealId);
          },
          child: const Icon(Icons.delete)),
    );
  }

  buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Text(text,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
    );
  }

  buildContainer(Widget child) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      height: 200,
      width: 360,
      child: child,
    );
  }
}
