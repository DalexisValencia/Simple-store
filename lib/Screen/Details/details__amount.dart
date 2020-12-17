import 'package:flutter/material.dart';
import 'package:flutter_first_app/Widget/button.dart';

class AmountProducts extends StatefulWidget {
  @override
  _AmountProductsState createState() => _AmountProductsState();
}

class _AmountProductsState extends State<AmountProducts> {
  int values = 1;
  void addItem() {
    setState(() {
      values++;
    });
  }

  void removeItem() {
    if (values >= 1) {
      setState(() {
        values--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(25, 10, 25, 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "Item",
            style: Theme.of(context).textTheme.subtitle1.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: 40,
                  height: 40,
                  child: CustomRaisedButton(
                    radius: 12,
                    color: Theme.of(context).primaryColor,
                    function: () => removeItem(),
                    splashColor: Theme.of(context).textSelectionColor,
                    child: Icon(Icons.remove, size: 14),
                    borderColor: Theme.of(context).primaryColor,
                    padding: EdgeInsets.all(0),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 25,
                    right: 25,
                  ),
                  child: Text("$values"),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: 40,
                  height: 40,
                  child: CustomRaisedButton(
                    radius: 12,
                    color: Theme.of(context).primaryColor,
                    function: () => addItem(),
                    splashColor: Theme.of(context).textSelectionColor,
                    child: Icon(Icons.add, size: 14),
                    borderColor: Theme.of(context).primaryColor,
                    padding: EdgeInsets.all(0),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
