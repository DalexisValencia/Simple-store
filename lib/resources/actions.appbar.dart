import 'package:flutter/material.dart';

class ActionBarUser extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right:17, top: 10),
      child:  Stack(
        children: <Widget>[
          Positioned(
            child: CircleAvatar(
                child: FlutterLogo(),
            ),
          ),
          Positioned(
            top: 4,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Theme.of(context).accentColor
              ),
              width:8,
              height:8,
            ),
          )
        ],
      ),
    );
  }
}