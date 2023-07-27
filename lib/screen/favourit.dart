import 'package:flutter/material.dart';
import 'package:flutter_application_4/meal.dart';
import 'package:flutter_application_4/widgets/meal_item.dart';

class Favourt extends StatelessWidget {
  final List<Meal> favoritMeal;
  const Favourt(this.favoritMeal);

  @override
  Widget build(BuildContext context) {
    if (favoritMeal.isEmpty) {
      return Center(
        child: Text("you have no favourit yet - Start Adding some "),
      );
    } else {
   return   ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              id: favoritMeal![index].id,
              duration: favoritMeal![index].duration,
              complexity: favoritMeal![index].complexity,
              affordability: favoritMeal![index].affordability,
              imgURL: favoritMeal![index].imgURL,
              title: favoritMeal![index].title,
            );
          },
          itemCount: favoritMeal.length);
    }
  }
}
