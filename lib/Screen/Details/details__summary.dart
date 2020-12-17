import 'package:flutter/material.dart';
import 'package:flutter_first_app/Widget/screens__button.dart';

class SummaryProduct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      padding: EdgeInsets.fromLTRB(20, 23, 20, 23),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: <Widget>[
              Text(
                "Total",
                style: Theme.of(context).textTheme.subtitle1.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Text(
                "15.8",
                style: Theme.of(context).textTheme.headline6.copyWith(
                      color: Theme.of(context).textSelectionColor,
                      fontSize: 23,
                    ),
              )
            ],
          ),
          Container(
            child: CustomRaisedButton(
              radius: 12,
              color: Theme.of(context).accentColor,
              function: () {
                print("Añadir al carrito");
              },
              splashColor: Theme.of(context).primaryColorLight,
              child: Text(
                "Add to order",
                style: TextStyle(
                  color: Theme.of(context).primaryColorLight,
                ),
              ),
              borderColor: Theme.of(context).accentColor,
              padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
            ),
          )
        ],
      ),
    );
  }
}
