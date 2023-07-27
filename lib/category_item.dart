import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class CategoryItem extends StatelessWidget {
  final String Title;
  final Color color;
  final String id;
  const CategoryItem(this.Title, this.color, this.id);

  void SelectedCategory(BuildContext context) {
    //Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      //return CategoryMealScreen(id, Title);
    //}));
    Navigator.of(context).pushNamed("/category-meal",arguments: {'id' : id, 'title': Title});
   
      }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => SelectedCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Text(
          Title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [color.withOpacity(0.7), color],
                begin: Alignment.topLeft,
                end: Alignment.topRight),
            borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
