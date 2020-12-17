import 'package:flutter/material.dart';
import 'package:flutter_first_app/Widget/button.dart';

class SelectedSize extends StatefulWidget {
  @override
  _SelectedSizeState createState() => _SelectedSizeState();
}

class _SelectedSizeState extends State<SelectedSize> {
  List<String> sizes = ['Medium', 'Large'];
  String size = "Large";

  void selectSized(sized) {
    setState(() {
      size = sized;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(25, 15, 25, 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "Size",
            style: Theme.of(context).textTheme.subtitle1.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          Container(
            child: Row(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width / 1.5,
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: sizes.length,
                    itemBuilder: (BuildContext context, int index) {
                      var title = sizes[index];
                      return Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: CustomRaisedButton(
                          radius: 12,
                          color: size == title
                              ? Theme.of(context).textSelectionColor
                              : Theme.of(context).primaryColorLight,
                          function: () => selectSized(title),
                          splashColor: size == title
                              ? Theme.of(context).primaryColorLight
                              : Theme.of(context).textSelectionColor,
                          child: Text(
                            title,
                            style: TextStyle(
                              color: size == title
                                  ? Theme.of(context).primaryColorLight
                                  : Theme.of(context).textSelectionColor,
                            ),
                          ),
                          borderColor: size == title
                              ? Theme.of(context).textSelectionColor
                              : Theme.of(context).primaryColor,
                          padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
