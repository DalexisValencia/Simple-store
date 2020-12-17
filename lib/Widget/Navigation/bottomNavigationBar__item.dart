import 'package:flutter/material.dart';
import 'package:flutter_first_app/Widget/screens__button.dart';

class ItemBottomNavigatorInactive extends StatelessWidget {
  final IconData icon;
  final Function onTapFunction;
  ItemBottomNavigatorInactive({
    this.icon,
    this.onTapFunction,
  });
  @override
  Widget build(BuildContext context) {
    return CustomRaisedButton(
      radius: 12,
      color: Theme.of(context).primaryColorLight,
      function: () => onTapFunction(),
      child: Icon(icon, color: Theme.of(context).accentColor),
      borderColor: Color(0x00000000),
      splashColor: Theme.of(context).accentColor,
      padding: EdgeInsets.all(2),
    );
  }
}
