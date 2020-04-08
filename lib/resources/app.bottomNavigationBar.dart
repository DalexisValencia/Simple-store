import 'package:flutter/material.dart';
import 'package:to_do_list/resources/button.dart';

class BottomNavigatorBarInApp extends StatelessWidget{
  final int activeIndex;
  List menuItems = new List.generate(
    5, (i){
      var indexOne = i+1;
      if ( indexOne == 2 ){
        return Text("s");
      }else{
        return Text("d");
      }
    }); 
  BottomNavigatorBarInApp({this.activeIndex});
  goToLocarton(context, name){
    Navigator.pushNamed(context, name);// Navigator.pushNamed(context, '/detail');
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
              padding: EdgeInsets.fromLTRB(20, 5, 20 , 5),
              color: Theme.of(context).primaryColorLight,
              height: 50,
              child:Row(
                children: <Widget>[
                  Expanded(
                    child: activeIndex == 1 ?
                      ItemBottomNavigatorBarActive(text: 'Home', icon: Icons.home,) : 
                      ItemBottomNavigatorInactive( icon: Icons.home, onTapFunction: () => goToLocarton(context, '/'),
                    ),
                  ),
                  Expanded(
                    child: activeIndex == 2 ?
                      ItemBottomNavigatorBarActive(text: 'Store', icon: Icons.store,) : 
                      ItemBottomNavigatorInactive( icon: Icons.store, onTapFunction: () => goToLocarton(context, '/products'),
                    ),
                  ),
                  Expanded(
                    child: activeIndex == 3 ?
                      ItemBottomNavigatorBarActive(text: 'Info', icon: Icons.apps) : 
                      ItemBottomNavigatorInactive( icon: Icons.apps, onTapFunction: () => goToLocarton(context, '/detail'),
                    ),
                  ),
                  Expanded(
                    child: activeIndex == 4 ?
                      ItemBottomNavigatorBarActive(text: 'Cart', icon: Icons.shopping_cart) : 
                      ItemBottomNavigatorInactive( icon: Icons.shopping_cart, onTapFunction: () => goToLocarton(context, '/'),
                    ),
                  ),
                ]
              )
            ),
          )
        ),
      );
  }
}

class ItemBottomNavigatorInactive extends StatelessWidget{
  final IconData icon;
  final Function onTapFunction;
  ItemBottomNavigatorInactive({this.icon, this.onTapFunction});
  @override
  Widget build(BuildContext context) {
    return CustomRaisedButton(
      radius: 12,
      color: Theme.of(context).primaryColorLight,
      function: () => onTapFunction(),
      child: Icon(
        icon,
        color: Theme.of(context).accentColor
      ),
      borderColor: Color(0x00000000),
      splashColor: Theme.of(context).accentColor,
      padding: EdgeInsets.all(2),
    );
  }
}

class ItemBottomNavigatorBarActive extends StatelessWidget{
  final IconData icon;
  final String text;
  ItemBottomNavigatorBarActive({this.icon, this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomRaisedButton(
        radius: 12,
        color: Theme.of(context).primaryColor,
        function: (){},
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
                  color: Theme.of(context).accentColor
                ),
              )
            ],
          )
        ),
        borderColor: Color(0x00000000),
        splashColor: Theme.of(context).primaryColor,
        padding: EdgeInsets.all(2),
      )
    );
  }
}