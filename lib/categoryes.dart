import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_4/dummy.categories.dart';
import 'category_item.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: EdgeInsets.all(25),
        children: DUMMY_CATEGORIES
            .map((catData) => CategoryItem(
                  catData.title,
                  catData.color,
                  catData.id,
                ))
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            // mainAxisExtent: 800,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20));
  }
}
