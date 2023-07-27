import 'package:flutter/material.dart';
import 'package:flutter_application_4/screen/drawer.dart';

class FilterSvreen extends StatefulWidget {
  final Function Savefilter;

  const FilterSvreen(this.Savefilter);
  static const RouteName = '/filter';

  @override
  State<FilterSvreen> createState() => _FilterSvreenState();
}

class _FilterSvreenState extends State<FilterSvreen> {
  bool _glutenFree = false;
  bool _vigetrianFree = false;
  bool _vegan = false;
  bool _lactosfree = false;

  Widget _BuiltSwitchListtile(String title, String description,
      bool currentvalue, Function adabtivevalue) {
    return SwitchListTile(
        title: Text(title),
        subtitle: Text(description),
        value: currentvalue,
        onChanged: adabtivevalue());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("your filters"),
          actions: [
            IconButton(
                onPressed: () {
                  final selectedfilter = {
                    'gluten': _glutenFree,
                    'lactose': _lactosfree,
                    'Vegan': _vegan,
                    'Vegitrian': _vigetrianFree
                  };
                  widget.Savefilter(selectedfilter);
                },
                icon: Icon(Icons.save)),
          ],
        ),
        drawer: MainDrawer(),
        body: Column(children: [
          Container(
              child: Text(
            "Adust your meal selection",
            style: Theme.of(context).textTheme.titleLarge,
          )),
          Expanded(
              child: ListView(children: [
            SwitchListTile(
                title: Text("Loctos-Free"),
                subtitle: Text("only include Loctos-Free meals"),
                value: _lactosfree,
                onChanged: (newvalues) {
                  setState(() {
                    _lactosfree = newvalues;
                  });
                }),
            SwitchListTile(
                title: Text("Gluten-Free"),
                subtitle: Text("only include gluten-Free meals"),
                value: _glutenFree,
                onChanged: (newvalues) {
                  setState(() {
                    _glutenFree = newvalues;
                  });
                }),
            SwitchListTile(
                title: Text("Vegitarian"),
                subtitle: Text("only include Vegitarian-Free meals"),
                value: _vigetrianFree,
                onChanged: (newvalues) {
                  setState(() {
                    _vigetrianFree = newvalues;
                  });
                }),
            SwitchListTile(
                title: Text("Vegan"),
                subtitle: Text("only include Vegan-Free meals"),
                value: _vegan,
                onChanged: (newvalues) {
                  setState(() {
                          _vegan = newvalues;
                  });
                })

            /*  _BuiltSwitchListtile(
                "Gluten-Free", "only include gluten-Free meals", _glutenFree,
                (newvalues) {
              setState(() {
                _glutenFree = newvalues;
              });
            }),
            _BuiltSwitchListtile(
                "Loctos-Free", "only include Loctos-Free meals", _lactosfree,
                (newvalue) {
              setState(() {
                _lactosfree = newvalue;
              });
            }),
            _BuiltSwitchListtile(
                "Vegitarian", "only include Vegitarian meals", _vigetrianFree,
                (newvalue) {
              setState(() {
                _vigetrianFree = newvalue;
              });
            }),
            _BuiltSwitchListtile("Vegan", "only include Vegan meals", _vegan,
                (newvalue) {
              setState(() {
                _vegan = newvalue;
              });
            })*/
          ]))
        ]));
  }
}
