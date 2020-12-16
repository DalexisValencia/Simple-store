import 'package:flutter/material.dart';

class GiftCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function function;

  GiftCard({
    this.title,
    this.icon,
    this.function,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).primaryColorLight,
      elevation: 0,
      child: InkWell(
        splashColor: Theme.of(context).accentColor,
        highlightColor: Theme.of(context).textSelectionColor,
        child: Padding(
          padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
          child: Column(
            children: <Widget>[
              Icon(
                icon,
                size: 42,
                color: Theme.of(context).accentColor,
              ),
              Padding(
                padding: EdgeInsets.only(top: 4),
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(title),
                ),
              ),
            ],
          ),
        ),
        onTap: function, //Click
      ),
    );
  }
}
