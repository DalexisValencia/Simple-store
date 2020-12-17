import 'package:flutter/material.dart';
import 'package:flutter_first_app/Widget/screens__button.dart';

class ItemBottomNavigatorBarActive extends StatelessWidget {
  final IconData icon;
  final String text;
  ItemBottomNavigatorBarActive({
    this.icon,
    this.text,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomRaisedButton(
        radius: 12,
        color: Theme.of(context).primaryColor,
        function: () {},
        child: FittedBox(
          child: Row(
            children: <Widget>[
              Icon(
                icon,
                color: Theme.of(context).accentColor,
              ),
              Text(
                text,
                style: TextStyle(
                  color: Theme.of(context).accentColor,
                ),
              )
            ],
          ),
        ),
        borderColor: Color(0x00000000),
        splashColor: Theme.of(context).primaryColor,
        padding: EdgeInsets.all(2),
      ),
    );
  }
}
