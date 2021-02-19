// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/main.dart';
import 'package:flutter_complete_guide/screens/categories_screen.dart';
import 'package:flutter_complete_guide/screens/category_meals_screen.dart';
import 'package:flutter_complete_guide/screens/filters_screen.dart';
import 'package:flutter_complete_guide/screens/meal_detail_screen.dart';
import 'package:flutter_complete_guide/screens/tabs_screen.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_complete_guide/models/meal.dart';

void main() {
  Widget _enableWidgetForTesting(Widget child) {
    return MaterialApp(
      home: child,
      routes: {
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen([]),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(() {}, () {}),
        FiltersScreen.routeName: (ctx) => FiltersScreen({}, () {}),
      },
    );
  }

  testWidgets('Opens categories scren and expecting to find Italina category',
      (WidgetTester tester) async {
    //arrange
    await tester.pumpWidget(_enableWidgetForTesting(CategoriesScreen()));

    final italianCategory = find.byKey(Key('c1'));

    expect(italianCategory, findsOneWidget);
  });
}
