import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final Color color;
  final String title;

  const CategoryItem(this.id, this.color, this.title, {Key key})
      : super(key: key);

  void changeScreen(BuildContext ctx) {
    Navigator.of(ctx)
        .pushNamed('/categories', arguments: {"id": id, "title": title});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius:
          BorderRadius.circular(15), // BITNO DA JE ISTI KAO I OD BoxDecoration
      onTap: () => changeScreen(context),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(title, style: Theme.of(context).textTheme.title),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
