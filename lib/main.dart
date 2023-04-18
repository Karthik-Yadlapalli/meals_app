// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:meals_app/screens/category_meals_screen.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';
import 'screens/categories_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Make my meal',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: const Color.fromRGBO(255, 254, 223, 1),
          fontFamily: 'Raleway',
          textTheme: const TextTheme(
            titleLarge: TextStyle(fontFamily: 'RobotoCondensed', fontSize: 24),
            titleMedium: TextStyle(
                fontFamily: 'Raleway',
                fontSize: 18,
                fontWeight: FontWeight.w500),
            titleSmall: TextStyle(
                fontFamily: 'Raleway',
                fontSize: 12,
                fontWeight: FontWeight.w300),
          )),
      debugShowCheckedModeBanner: false,
      //for Named routes using pushNamed()
      routes: {
        '/': (context) => const Categories(),
        CategoryMealsScreen.routeName: (context) => const CategoryMealsScreen(),
        MealDetailScreen.routeName: (context) => const MealDetailScreen()
      },

      //this is used when we need to route between pages based on actions
      //Example
      onGenerateRoute: (settings) {
        // if(settings.name=="...."){
        //   return ...;
        // }else{
        //   return ...;
        // }
        //return MaterialPageRoute(builder: ((context) => CategoryMealsScreen()));
      },

      //this is default route, when there is unknown route
      //Example
      onUnknownRoute: (settings) {
        //return MaterialPageRoute(builder: ((context) => CategoryMealsScreen()));
      },

      //home: const Categories(),
    );
  }
}
