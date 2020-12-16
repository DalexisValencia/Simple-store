import 'package:flutter/material.dart';

class CustomRaisedButton extends StatelessWidget {
  final double radius;
  final Color color;
  final Function function;
  final Widget child;
  final Color borderColor;
  final Color splashColor;
  final EdgeInsets padding; //Recordar que los mas nuevos no lo tienen

  CustomRaisedButton(
      {this.color,
      this.function,
      this.child,
      this.borderColor,
      this.splashColor,
      this.padding,
      this.radius});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      padding: padding,
      elevation: 0,
      splashColor: splashColor == null ? color : splashColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
          side: BorderSide(width: 2, color: borderColor)),
      onPressed: function,
      color: color,
      child: child,
    );
  }
}
