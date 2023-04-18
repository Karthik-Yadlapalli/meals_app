import 'package:flutter/material.dart';
import 'package:meals_app/models/meals.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';

class MealItem extends StatelessWidget {
  MealItem(
      {super.key,
      this.removeItem,
      required this.id,
      required this.affordability,
      required this.complexity,
      required this.duration,
      required this.imageUrl,
      required this.title});

  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  Function? removeItem;

  String get complexityText {
    switch (complexity) {
      case Complexity.Easy:
        return 'Simple';

      case Complexity.Challenging:
        return 'Challenging';

      case Complexity.Hard:
        return 'Hard';

      default:
        return 'Unknown';
    }
  }

  String get affordibilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';

      case Affordability.Pricey:
        return 'Pricey';

      case Affordability.Luxurious:
        return 'Luxurious';

      default:
        return 'Unknown';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        stlectMeal(context);
      },
      child: Card(
        margin: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 3,
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 13,
                  right: 6,
                  child: Container(
                    width: 300,
                    color: Colors.black54.withOpacity(0.2),
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 14),
                    child: Text(
                      title,
                      style: const TextStyle(fontSize: 22, color: Colors.white),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(18),
              child: Row(
                children: [
                  Row(
                    children: [
                      const Icon(Icons.schedule),
                      const SizedBox(
                        width: 4,
                      ),
                      Text('$duration min'),
                      const SizedBox(
                        width: 20,
                      ),
                      const Icon(Icons.work),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(complexityText),
                      const SizedBox(
                        width: 150,
                      ),
                      const Icon(Icons.attach_money),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(affordibilityText),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void stlectMeal(BuildContext context) {
    Navigator.of(context)
        .pushNamed(MealDetailScreen.routename, arguments: id)
        .then((value) {
      if (value != null) {
        removeItem!(value);
      }
    });
  }
}
