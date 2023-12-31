import 'package:flutter/material.dart';
import 'package:flutter_application_4/meal.dart';
import 'package:flutter_application_4/screen/MealDetailScreen.dart';

class MealItem extends StatelessWidget {
  String title;
  String imgURL;
  final String id;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  
  MealItem(
      {super.key,
      required this.duration,
      required this.complexity,
      required this.affordability,
      required this.imgURL,
      required this.title,
      required this.id,
    m});

  String get complextyText {
    switch (complexity) {
      case Complexity.Simple:
        return 'simple';
      case Complexity.Challeging:
        return '....';
      case Complexity.Hard:
        return '...';
      default:
        return 'unknown';
    }
  }

  String get affordableText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
      case Affordability.Luxurios:
        return 'Expensive';
      case Affordability.Pricey:
        return 'Pricy';
      default:
        return 'unknown';
    }
  }

  void SelectMeal(BuildContext context) {
    Navigator.of(context)
        .pushNamed(MealDetailScreen.RouteName, arguments: id)
        .then((value) {
      if (value != null) {
     //   removeItem(value);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => SelectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network(
                    imgURL,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: Text(
                      title,
                      style: TextStyle(fontSize: 20, color: Colors.white),
                      softWrap: false,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(
                        width: 6,
                      ),
                      Text("${duration} min")
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work),
                      SizedBox(
                        width: 6,
                      ),
                      Text(complextyText)
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money),
                      SizedBox(
                        width: 6,
                      ),
                      Text(affordableText)
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
}
