import 'package:flutter/material.dart';
import 'package:flutter_first_app/Widget/Navigation/bottomNavigationBar__item.dart';
import 'package:flutter_first_app/Widget/Navigation/bottomNavigationBar__itemActive.dart';

class BottomNavigatorBarInApp extends StatefulWidget {
  final int activeIndex;
  BottomNavigatorBarInApp({this.activeIndex});
  @override
  _BottomNavigatorBarInAppState createState() =>
      _BottomNavigatorBarInAppState();
}

class _BottomNavigatorBarInAppState extends State<BottomNavigatorBarInApp> {
  List menuItems = new List.generate(5, (i) {
    var indexOne = i + 1;
    if (indexOne == 2) {
      return Text("s");
    } else {
      return Text("d");
    }
  });

  goToLocarton(context, name) {
    Navigator.pushNamed(
      context,
      name,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Theme.of(context).primaryColor,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: Container(
            padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
            color: Theme.of(context).primaryColorLight,
            height: 50,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: widget.activeIndex == 1
                      ? ItemBottomNavigatorBarActive(
                          text: 'Home',
                          icon: Icons.home,
                        )
                      : ItemBottomNavigatorInactive(
                          icon: Icons.home,
                          onTapFunction: () => goToLocarton(
                            context,
                            '/',
                          ),
                        ),
                ),
                Expanded(
                  child: widget.activeIndex == 2
                      ? ItemBottomNavigatorBarActive(
                          text: 'Store',
                          icon: Icons.store,
                        )
                      : ItemBottomNavigatorInactive(
                          icon: Icons.store,
                          onTapFunction: () => goToLocarton(
                            context,
                            '/products',
                          ),
                        ),
                ),
                Expanded(
                  child: widget.activeIndex == 3
                      ? ItemBottomNavigatorBarActive(
                          text: 'Info',
                          icon: Icons.apps,
                        )
                      : ItemBottomNavigatorInactive(
                          icon: Icons.apps,
                          onTapFunction: () => goToLocarton(
                            context,
                            '/detail',
                          ),
                        ),
                ),
                Expanded(
                  child: widget.activeIndex == 4
                      ? ItemBottomNavigatorBarActive(
                          text: 'Cart',
                          icon: Icons.shopping_cart,
                        )
                      : ItemBottomNavigatorInactive(
                          icon: Icons.shopping_cart,
                          onTapFunction: () => goToLocarton(
                            context,
                            '/',
                          ),
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
