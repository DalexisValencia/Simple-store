import 'package:flutter/material.dart';
import 'package:flutter_first_app/Screen/Home/gifts/gifts__card.dart';

class Gifts extends StatefulWidget {
  GiftsState createState() => GiftsState();
}

class GiftsState extends State<Gifts> {
  int indexActive;
  setSelectedButton(indicativo) {
    setState(() {
      indexActive = indicativo;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: GiftCard(
            title: "Felicidades",
            icon: Icons.card_giftcard,
            function: () {},
          ),
        ),
        Expanded(
          child: GiftCard(
            title: "Coupons",
            icon: Icons.turned_in,
            function: () {},
          ),
        ),
        Expanded(
          child: GiftCard(
            title: "Quick Scan",
            icon: Icons.blur_on,
            function: () {},
          ),
        ),
      ],
    );
  }
}
