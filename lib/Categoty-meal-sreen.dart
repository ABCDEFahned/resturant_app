import 'package:flutter/material.dart';
import 'package:flutter_application_4/dummy.categories.dart';
import 'package:flutter_application_4/meal.dart';
import 'package:flutter_application_4/widgets/meal_item.dart';

class CategoryMealScreen extends StatefulWidget {
  //final String categoryId;
  //final String categoryTitle;
  // const CategoryMealScreen(this.categoryId, this.categoryTitle);
  List<Meal> _availableMeal;

  CategoryMealScreen(this._availableMeal);
  static const routeName = "/category-meal";

  @override
  State<CategoryMealScreen> createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  String? categoryItem;
  List<Meal>? displatMeal;
  bool _loadedInitData = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void _removemeal(String mealid) {
    setState(() {
      displatMeal?.removeWhere((meal) => meal.id == mealid);
    });
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    if (!_loadedInitData) {
      final routeAegs =
          ModalRoute.of(context)?.settings.arguments as Map<String, String>;
      categoryItem = routeAegs['title'];
      final categoryId = routeAegs['id'];
      displatMeal = widget._availableMeal
          .where((meal) {
            return meal.categories.contains(categoryId);
          })
          .cast<Meal>()
          .toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryItem!),
        ),
        body: ListView.builder(
            itemBuilder: (ctx, index) {
              return MealItem(
                id: displatMeal![index].id,
                duration: displatMeal![index].duration,
                complexity: displatMeal![index].complexity,
                affordability: displatMeal![index].affordability,
                imgURL: displatMeal![index].imgURL,
                title: displatMeal![index].title,
              );
            },
            itemCount: displatMeal?.length));
  }
}
