// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data/dummy_data.dart';
import 'package:meals_app/screens/category_meals_screen.dart';
import 'package:meals_app/screens/filters_screen.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';
import 'package:meals_app/screens/tabs_screen.dart';
import 'models/meals.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favouritMeals = [];

  Map<String, bool> filters = {
    'isGlutenFree': false,
    'isVegan': false,
    'isVegetarian': false,
    'isLactoseFree': false
  };

  void steFilter(Map<String, bool> filterData) {
    setState(() {
      filters = filterData;

      _availableMeals = DUMMY_MEALS.where((element) {
        if (filters['isGlutenFree'] == true && !element.isGlutenFree) {
          return false;
        }
        if (filters['isVagan'] == true && !element.isVegan) {
          return false;
        }
        if (filters['isVegetarian'] == true && !element.isVegetarian) {
          return false;
        }
        if (filters['isLactoseFree'] == true && !element.isLactoseFree) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void toggleFavourits(mealId) {
    final elementIndex =
        _favouritMeals.indexWhere((element) => element.id == mealId);
    if (elementIndex >= 0) {
      setState(() {
        _favouritMeals.removeAt(elementIndex);
      });
    } else {
      setState(() {
        _favouritMeals
            .add(DUMMY_MEALS.firstWhere((element) => element.id == mealId));
      });
    }
  }

  bool isMealFavourite(String id) {
    return _favouritMeals.any((element) => element.id == id);
  }

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
        '/': (context) => TabsScreen(favouritMeals: _favouritMeals),
        CategoryMealsScreen.routeName: (context) => CategoryMealsScreen(
              availableMeals: _availableMeals,
            ),
        MealDetailScreen.routename: (context) => MealDetailScreen(
            toggelFavourits: toggleFavourits, isFavourit: isMealFavourite),
        FiltersScreen.routeName: (context) => FiltersScreen(
              currentFilters: filters,
              saveFilters: steFilter,
            )
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
