import 'package:flutter/material.dart';

class CategoriesFilter extends StatefulWidget {
  @override
  CategoriesFilterState createState() => CategoriesFilterState();
}

class CategoriesFilterState extends State<CategoriesFilter> {
  int active = 1;

  List<String> categories = [
    'Drinks',
    'Cake',
    'Coffe',
    'Beer',
    'Snakes',
  ];

  void setActive(index) {
    setState(() {
      active = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20),
      height: 50,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.only(
              right: 10,
            ),
            child: RaisedButton(
              elevation: 0,
              color: active == index
                  ? Theme.of(context).textSelectionColor
                  : Theme.of(context).primaryColorLight,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              onPressed: () => setActive(index),
              child: Text(
                "${categories[index]}",
                style: TextStyle(
                  color: active == index
                      ? Theme.of(context).primaryColorLight
                      : Theme.of(context).textSelectionColor,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
