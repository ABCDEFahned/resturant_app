import 'package:flutter/material.dart';
import 'package:flutter_application_4/Categoty-meal-sreen.dart';
import 'package:flutter_application_4/categoryes.dart';

import 'package:flutter_application_4/meal.dart';
import 'package:flutter_application_4/screen/MealDetailScreen.dart';
import 'package:flutter_application_4/screen/filterScreen.dart';
import 'package:flutter_application_4/screen/tapscreen.dart';

import 'dummy.categories.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'Vegan': false,
    'Vegitrian': false
  };
  List<Meal> _available = DUMMY_MEALS;
  List<Meal> favouritMeal = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _available = DUMMY_MEALS.where((meal) {
        if (_filters['gluten']! && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose']! && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['Vegan']! && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['Vegitrian']! && !meal.isGlutenFree) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toogleFavourit(String mealId) {
    final existingIndex = favouritMeal.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        favouritMeal.removeAt(existingIndex);
      });
    } else {
      setState(() {
        favouritMeal.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool _ismealFavourit(String id) {
    return favouritMeal.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: Colors.pink,
            primaryColor: Colors.amber,
            canvasColor: Color.fromRGBO(255, 254, 229, 1),
            fontFamily: 'Raleway',
            textTheme: ThemeData.light().textTheme.copyWith(
                bodyLarge: TextStyle(color: Color.fromRGBO(51, 51, 51, 1)),
                bodySmall: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
                titleLarge: TextStyle(
                    fontFamily: 'RobotoCondensed',
                    fontSize: 24,
                    fontWeight: FontWeight.bold))),
        initialRoute: '/',
        routes: {
          '/': (context) => TapScreenBar(favouritMeal),
          CategoryMealScreen.routeName: (_) => CategoryMealScreen(_available),
          MealDetailScreen.RouteName: (_) => MealDetailScreen(_toogleFavourit,_ismealFavourit),
          FilterSvreen.RouteName: (context) => FilterSvreen(_setFilters)
        },
        onGenerateRoute: (settings) {
          print(settings.arguments);

          //if (settings.name == '/category-mea') {
          //  return '...';
          //  }
          //   return MaterialPageRoute(builder: (_) => CategoryScreen());
        },
        onUnknownRoute: (settings) {
          return MaterialPageRoute(builder: (ctx) => CategoryScreen());
        });
  }
}
