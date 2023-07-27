import 'package:flutter/material.dart';
import 'package:flutter_application_4/screen/filterScreen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});
  Widget BuiltListtile(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 20,
      ),
      title: Text(
        title,
        style: TextStyle(
            fontFamily: "RobotoCondensed",
            fontSize: 24,
            fontWeight: FontWeight.bold),
      ),
      onTap: () {
        tapHandler();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).primaryColor,
            child: Text(
              "Cooking Up !",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 30, color: Colors.red),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          BuiltListtile('Meal', Icons.restaurant, () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          BuiltListtile('Filters', Icons.settings, () {
            Navigator.of(context).pushReplacementNamed(FilterSvreen.RouteName);
          })
        ],
      ),
    );
  }
}
