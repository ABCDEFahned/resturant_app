import 'package:flutter/material.dart';
import 'package:flutter_application_4/dummy.categories.dart';

class MealDetailScreen extends StatelessWidget {
  final Function togleFavourite;
  final Function isfavourit;
  const MealDetailScreen(this.togleFavourite, this.isfavourit);
  static const RouteName = '/meal-Detail';

  Widget buildSelectedTitle(BuildContext context, String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }

  Widget BuildContainer(Widget Child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(20),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 150,
      width: 300,
      child: Child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealid = ModalRoute.of(context)?.settings.arguments as String;
    final selectedid = DUMMY_MEALS.lastWhere((element) => element.id == mealid);
    return Scaffold(
      appBar: AppBar(title: Text("${selectedid.title}")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedid.imgURL,
                fit: BoxFit.cover,
              ),
            ),
            buildSelectedTitle(context, 'Ingrediant'),
            BuildContainer(ListView.builder(
              itemBuilder: (context, index) => Card(
                color: Theme.of(context).primaryColor,
                child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(selectedid.ingredients[index])),
              ),
              itemCount: selectedid.ingredients.length,
            )),
            buildSelectedTitle(context, 'Steps'),
            BuildContainer(
              ListView.builder(
                itemBuilder: (context, index) => Column(children: [
                  ListTile(
                    leading: CircleAvatar(
                      child: Text("${index + 1}"),
                    ),
                    title: Text(selectedid.steps[index]),
                  ),
                  Divider()
                ]),
                itemCount: selectedid.steps.length,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(isfavourit(mealid) ? Icons.star : Icons.star_border),
          
          onPressed: () {
            togleFavourite(mealid);
          }),
    );
  }
}
