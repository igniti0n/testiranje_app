import 'package:flutter/material.dart';

import '../screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget _buildTile(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        title,
        style: TextStyle(
            fontFamily: 'Raleway', fontSize: 24, fontWeight: FontWeight.w700),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      key: Key('drawer'),
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(20),
            height: 120,
            width: double.infinity,
            color: Theme.of(context).accentColor,
            child: Text(
              "Cooking up!",
              style: TextStyle(
                color: Colors.red,
                fontFamily: 'Raleway',
                fontSize: 26,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          _buildTile(
            "Meals",
            Icons.restaurant,
            () => Navigator.of(context).pushNamed('/'),
          ),
          _buildTile(
            "Filters",
            Icons.settings,
            () => Navigator.of(context)
                .pushReplacementNamed(FiltersScreen.routeName),
          ),
        ],
      ),
    );
  }
}
