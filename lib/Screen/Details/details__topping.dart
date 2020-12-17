import 'package:flutter/material.dart';
import 'package:flutter_first_app/Widget/button.dart';

class AddTopping extends StatefulWidget {
  @override
  _AddToppingState createState() => _AddToppingState();
}

class _AddToppingState extends State<AddTopping> {
  List<String> topping = [
    'Sugar',
    'Milk',
    'Pearl',
    'Jelly',
    'Red Bean',
    'Cheese'
  ];
  String active = "Sugar";

  void setActiveTopping(toppingValue) {
    setState(() {
      active = toppingValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10, left: 25),
      height: 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Topping",
            style: Theme.of(context).textTheme.subtitle1.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10),
            height: 60,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: topping.length,
              itemBuilder: (BuildContext context, int index) {
                var currentTitle = topping[index];
                return Padding(
                  padding: EdgeInsets.only(
                    right: 12,
                  ),
                  child: CustomRaisedButton(
                    radius: 12,
                    color: currentTitle == active
                        ? Theme.of(context).textSelectionColor
                        : Theme.of(context).primaryColorLight,
                    function: () => setActiveTopping(currentTitle),
                    splashColor: currentTitle == active
                        ? Theme.of(context).primaryColorLight
                        : Theme.of(context).textSelectionColor,
                    child: Text(
                      "${topping[index]}",
                      style: TextStyle(
                          color: currentTitle == active
                              ? Theme.of(context).primaryColorLight
                              : Theme.of(context).textSelectionColor),
                    ),
                    borderColor: currentTitle == active
                        ? Theme.of(context).textSelectionColor
                        : Theme.of(context).primaryColor,
                    padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
