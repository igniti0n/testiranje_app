import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';
import '../models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static final routeName = '/categories';
  final List<Meal> availbleMeals;

  CategoryMealsScreen(this.availbleMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  List<Meal> displayedMeals;
  String title;
  bool _loadedInitialData = false;

  @override
  void didChangeDependencies() {
    if (!_loadedInitialData) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      title = routeArgs['title'];
      final categoryId = routeArgs['id'];
      displayedMeals = widget.availbleMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      super.didChangeDependencies();
      _loadedInitialData = true;
    }
    // TODO: implement didChangeDependencies
  }

  void _deleteItem(String id) {
    setState(() {
      displayedMeals.removeWhere(
        (meal) => id == meal.id,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: displayedMeals[index].id,
            title: displayedMeals[index].title,
            affordability: displayedMeals[index].affordability,
            complexity: displayedMeals[index].complexity,
            duration: displayedMeals[index].duration,
            imageUrl: displayedMeals[index].imageUrl,
            //deleteItem: _deleteItem,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
