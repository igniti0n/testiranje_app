import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('meals app test', () {
    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() {
      if (driver != null) driver.close();
    });

    final _italianCategory = find.text('Italian');
    final _spagetti = find.text('Spaghetti with Tomato Sauce');

    Future<void> _wait() async {
      return Future.delayed(Duration(seconds: 2));
    }

    test('open all italian meals', () async {
      await driver.waitForAbsent(_spagetti);
      await _wait();
      await driver.tap(_italianCategory);
      await _wait();
      await driver.waitFor(_spagetti);
      await _wait();
      // await driver.waitUntilNoTransientCallbacks();
      assert(_italianCategory != null);

      driver.tap(find.byTooltip('Back'));
    });

    final _favouriteButton = find.byType('FloatingActionButton');

    test(
        'open all italian meals, open Spaghetti, we can see favourite floating action button',
        () async {
      //see italian meals only and tap on them
      await driver.waitForAbsent(_spagetti);
      await driver.waitForAbsent(_favouriteButton);
      await _wait();
      await driver.tap(_italianCategory);
      await _wait();
      //see spagetti, not FAB
      await driver.waitFor(_spagetti);
      await driver.waitForAbsent(_favouriteButton);
      await driver.tap(_spagetti);
      await _wait();
      //see FAB and click on it
      await driver.waitFor(_favouriteButton);
      await driver.tap(_favouriteButton);
      await _wait();
      await driver.waitUntilNoTransientCallbacks();

      assert(_italianCategory != null);

      driver.tap(find.byTooltip('Back'));
      driver.tap(find.byTooltip('Back'));
    });

    final _ingredients = find.text('Ingredients');
    test('find spagetti and scroll trough ingridients', () async {
      //see italian meals only and tap on them
      await driver.waitForAbsent(_spagetti);
      await driver.waitForAbsent(_favouriteButton);
      await _wait();
      await driver.tap(_italianCategory);
      await _wait();
      //see spagetti, not FAB
      await driver.waitFor(_spagetti);
      await driver.waitForAbsent(_favouriteButton);
      await driver.tap(_spagetti);
      await _wait();
      //see FAB and click on it
      await driver.waitFor(_favouriteButton);
      await driver.tap(_favouriteButton);
      await _wait();
      await driver.waitUntilNoTransientCallbacks();
      await driver.scroll(_ingredients, 0, -100, Duration(milliseconds: 100));
      await driver.waitUntilNoTransientCallbacks();
      assert(_italianCategory != null);

      driver.tap(find.byTooltip('Back'));
      driver.tap(find.byTooltip('Back'));
    });

    final _favButtonNavigation = find.text('Favorites');
    final _catButtonNavigation = find.text('Categories');

    test('go to favories, see that ther ei sno categories displayed', () async {
      //see italian meals only and tap on them

      await driver.waitFor(_italianCategory);
      await _wait();
      await driver.tap(_favButtonNavigation);
      await driver.waitForAbsent(_italianCategory);
      await _wait();

      await driver.tap(_catButtonNavigation);
    });

    test(
        'go to favories, see that ther ei sno categories displayed, go back to categories and confir that you sdee categories',
        () async {
      //see italian meals only and tap on them

      await driver.waitFor(_italianCategory);
      await _wait();
      await driver.tap(_favButtonNavigation);
      await driver.waitForAbsent(_italianCategory);
      await _wait();

      await driver.tap(_catButtonNavigation);
      await driver.waitFor(_italianCategory);
    });
  });
}
