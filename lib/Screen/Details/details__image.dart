import 'package:flutter/material.dart';
import 'package:flutter_first_app/Widget/button.dart';

class DetailsImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        image: DecorationImage(
          image: new AssetImage(
            'assets/detail-coffee.png',
          ),
          fit: BoxFit.fill,
        ),
      ),
      height: (MediaQuery.of(context).size.height / 3) + 50,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 30,
            left: 20,
            child: Container(
              width: 40,
              height: 40,
              child: CustomRaisedButton(
                radius: 50,
                color: Theme.of(context).primaryColor,
                function: () {
                  Navigator.of(context).pop();
                },
                splashColor: Theme.of(context).textSelectionColor,
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.black87,
                ),
                borderColor: Theme.of(context).primaryColor,
                padding: EdgeInsets.all(0),
              ),
            ),
          )
        ],
      ),
    );
  }
}
