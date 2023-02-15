class Meal {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final List<String> steps;
  final List<String> categories;
  final List<String> ingredients;
  final Complexity complexity;
  final Affordability affordability;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;

  const Meal({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.affordability,
    required this.categories,
    required this.complexity,
    required this.duration,
    required this.ingredients,
    required this.isGlutenFree,
    required this.isLactoseFree,
    required this.isVegan,
    required this.isVegetarian,
    required this.steps,
  });
}

enum Complexity { Easy, Challenging, Hard }

enum Affordability { Affordable, Pricey, Luxurious }
