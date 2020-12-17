import 'package:flutter/material.dart';
import 'package:flutter_first_app/Widget/screens__button.dart';

class ChooseDelivery extends StatefulWidget {
  ChooseDeliveryState createState() => ChooseDeliveryState();
}

class ChooseDeliveryState extends State<ChooseDelivery> {
  String activeButton = 'delivery';

  setStateButton(ki) {
    setState(() {
      activeButton = ki;
    });
  }

  Widget build(BuildContext context) {
    Color activeColor = Theme.of(context).textSelectionColor; //verde
    Color inactiveColor = Theme.of(context).primaryColorLight; //Blanco
    Color inactiveBorderColor = Theme.of(context).primaryColor; //Gris
    return Container(
      width: MediaQuery.of(context).size.width - 40,
      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: // Text("la info")
          Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: // Text("prueba")
                CustomRaisedButton(
              radius: 12,
              color: activeButton == 'delivery' ? activeColor : inactiveColor,
              borderColor: activeButton == 'delivery'
                  ? activeColor
                  : inactiveBorderColor,
              splashColor: activeButton == 'delivery'
                  ? Theme.of(context).primaryColorLight
                  : Theme.of(context).textSelectionColor,
              padding: EdgeInsets.all(6),
              function: () {
                setStateButton('delivery');
              },
              child: Container(
                alignment: Alignment.center,
                height: 50,
                child: Text(
                  "Delivery",
                  style: TextStyle(
                    fontSize: 14,
                    color: activeButton == 'delivery'
                        ? Theme.of(context).primaryColorLight
                        : Theme.of(context).textSelectionColor,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: // Text("Segundo")
                CustomRaisedButton(
              radius: 12,
              color: activeButton == 'pick' ? activeColor : inactiveColor,
              borderColor:
                  activeButton == 'pick' ? activeColor : inactiveBorderColor,
              splashColor: activeButton == 'pick'
                  ? Theme.of(context).primaryColorLight
                  : Theme.of(context).textSelectionColor,
              padding: EdgeInsets.all(6),
              function: () {
                setStateButton('pick');
              },
              child: Container(
                alignment: Alignment.center,
                height: 50,
                child: Text(
                  "Pick Up",
                  style: TextStyle(
                    fontSize: 14,
                    color: activeButton == 'pick'
                        ? Theme.of(context).primaryColorLight
                        : Theme.of(context).textSelectionColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
