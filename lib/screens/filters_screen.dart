import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static final routeName = "/filters-screen";
  final Function saveFilters;
  final Map<String, bool> filters;

  FiltersScreen(this.filters, this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

@visibleForTesting
Widget buildFilter(String title, String subtitle, bool value, Function change) {
  return SwitchListTile(
    title: Text(title),
    value: value,
    subtitle: Text(subtitle),
    onChanged: change,
  );
}

class _FiltersScreenState extends State<FiltersScreen> {
  var isVegan = false;
  var isVegetarian = false;
  var isGlutenFree = false;
  var isLactoseFree = false;

  @override
  void initState() {
    // TODO: implement initState
    isVegan = widget.filters["vegan"];
    isVegetarian = widget.filters["vegetarian"];
    isGlutenFree = widget.filters["gluten"];
    isLactoseFree = widget.filters["lactose"];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final selectedFilters = {
                  "gluten": isGlutenFree,
                  "lactose": isLactoseFree,
                  "vegan": isVegan,
                  "vegetarian": isVegetarian
                };

                widget.saveFilters(selectedFilters);
              })
        ],
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              height: 100,
              padding: EdgeInsets.all(30),
              child: Text(
                "Filters",
                style: Theme.of(context).textTheme.title,
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  buildFilter(
                    "Vegan",
                    "Display only vegan foods",
                    isVegan,
                    (newValue) {
                      setState(() {
                        isVegan = newValue;
                      });
                    },
                  ),
                  buildFilter(
                    "Vegetarian",
                    "Display only vegetarian foods",
                    isVegetarian,
                    (newValue) {
                      setState(() {
                        isVegetarian = newValue;
                      });
                    },
                  ),
                  buildFilter(
                    "Gluten-Free",
                    "Display only gluten-free foods",
                    isGlutenFree,
                    (newValue) {
                      setState(() {
                        isGlutenFree = newValue;
                      });
                    },
                  ),
                  buildFilter(
                    "Lactose-Free",
                    "Display only lactose-free foods",
                    isLactoseFree,
                    (newValue) {
                      setState(() {
                        isLactoseFree = newValue;
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
