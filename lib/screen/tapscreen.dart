import 'package:flutter/material.dart';
import 'package:flutter_application_4/categoryes.dart';
import 'package:flutter_application_4/meal.dart';
import 'package:flutter_application_4/screen/drawer.dart';
import 'package:flutter_application_4/screen/favourit.dart';

class TapScreenBar extends StatefulWidget {
  final List<Meal> favoritMeal;
  const TapScreenBar(this.favoritMeal);

  @override
  State<TapScreenBar> createState() => _TapScreenBarState();
}

class _TapScreenBarState extends State<TapScreenBar> {
  late List<Map> _pages;

  int _selectPageIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    _pages = [
      {'page': CategoryScreen(), "title": 'categories'},
      {'page': Favourt(widget.favoritMeal), 'title': 'your favourit'}
    ];
    super.initState();
  }

  void _selecteditem(int index) {
    setState(() {
      _selectPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_pages[_selectPageIndex]['title'].toString())),
      drawer: MainDrawer(),
      body:_pages[_selectPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
          onTap: _selecteditem,
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.black,
          selectedItemColor: Colors.green,
          currentIndex: _selectPageIndex,
          type: BottomNavigationBarType.shifting,
          items: [
            BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: Icon(Icons.category),
                label: "categories"),
            BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: Icon(Icons.star),
                label: "Favourit")
          ]),
    );
    /*DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: Scaffold(
          appBar: AppBar(
            title: Text("meals"),
            bottom: TabBar(tabs: [
              Tab(
                icon: Icon(Icons.category),
                child: Text("categorie"),
              ),
              Tab(
                icon: Icon(Icons.star),
                child: Text("favourit"),
              )
            ]),
          ),
          body: TabBarView(children: [CategoryScreen(), Favourt()]),
        ));*/
  }
}
