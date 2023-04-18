import 'package:flutter/material.dart';
import '../models/meals.dart';
import '../widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key, required this.favouritMeals});
  final List<Meal> favouritMeals;

  @override
  Widget build(BuildContext context) {
    if (favouritMeals.isEmpty) {
      return const Center(
        child: Text('You have no favourits yet!'),
      );
    } else {
      return ListView.builder(
        itemCount: favouritMeals.length,
        itemBuilder: (context, index) {
          return MealItem(
            title: favouritMeals[index].title,
            imageUrl: favouritMeals[index].imageUrl,
            duration: favouritMeals[index].duration,
            complexity: favouritMeals[index].complexity,
            affordability: favouritMeals[index].affordability,
            id: favouritMeals[index].id,
          );
        },
      );
    }
  }
}
