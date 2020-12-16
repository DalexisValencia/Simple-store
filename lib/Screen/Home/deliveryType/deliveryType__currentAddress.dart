import 'package:flutter/material.dart';
import 'package:flutter_first_app/Widget/button.dart';

class CurrentAddress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 40,
      padding: EdgeInsets.fromLTRB(20, 40, 20, 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).primaryColorLight,
      ),
      child: Column(
        children: <Widget>[
          ListTile(
            contentPadding: EdgeInsets.only(
              top: 10,
              bottom: 5,
            ),
            leading: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(Icons.location_on),
                ),
              ],
            ),
            title: Text("pick your order at",
                style: Theme.of(context).textTheme.caption),
            subtitle: Text(
              "Your Address",
              style: Theme.of(context).textTheme.headline6.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            trailing: Container(
              width: 40,
              height: 40,
              child: CustomRaisedButton(
                color: Theme.of(context).textSelectionColor,
                splashColor: Theme.of(context).primaryColorLight,
                radius: 12,
                borderColor: Color(0x00000000),
                function: () {},
                padding: EdgeInsets.all(0),
                child: Icon(
                  Icons.edit,
                  size: 21,
                  color: Theme.of(context).primaryColorLight,
                ),
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: CustomRaisedButton(
              color: Theme.of(context).accentColor,
              splashColor: Theme.of(context).primaryColorLight,
              radius: 12,
              borderColor: Color(0x00000000),
              function: () {},
              padding: EdgeInsets.all(20),
              child: Text(
                "Order now",
                style: Theme.of(context).textTheme.bodyText2.copyWith(
                      color: Theme.of(context).primaryColorLight,
                    ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
