import 'package:flutter/material.dart';
import 'package:flutter_first_app/Screen/Home/deliveryType/delivertType__chooseDelivery.dart';
import 'package:flutter_first_app/Screen/Home/deliveryType/deliveryType__currentAddress.dart';

class DeliveryType extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 250,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 25,
            child: CurrentAddress(),
          ),
          Positioned(
            top: 0,
            child: ChooseDelivery(),
          )
        ],
      ),
    );
  }
}
