import 'package:flutter/material.dart';
import 'package:flutter_first_app/Screen/Home/deliveryType/home__deliveryType.dart';
import 'package:flutter_first_app/Screen/Home/gifts/home__gifts.dart';
import 'package:flutter_first_app/Screen/Home/home__categoriesSlider.dart';
import 'package:flutter_first_app/Screen/Home/home__userName.dart';
import 'package:flutter_first_app/Widget/bottomNavigationBar.dart';
import 'package:flutter_first_app/Widget/button.dart';

class HomePage extends StatelessWidget {
  void onTabTapped() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        leading: Icon(Icons.menu),
        elevation: 0.0,
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              right: 17,
              top: 10,
            ),
            child: Stack(
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
                      color: Theme.of(context).accentColor,
                    ),
                    width: 8,
                    height: 8,
                  ),
                )
              ],
            ),
          )
        ],
      ),
      body: HomePageContent(),
      bottomNavigationBar: BottomNavigatorBarInApp(
        activeIndex: 1,
      ),
    );
  }
}

class HomePageContent extends StatefulWidget {
  HomePageContentState createState() => HomePageContentState();
}

class HomePageContentState extends State<HomePageContent> {
  String activeButton = 'pick';

  setActiveButton(value) {
    setState(() {
      activeButton = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: viewportConstraints.maxHeight,
            ),
            child: Padding(
              padding: EdgeInsets.only(
                top: 10,
                left: 20,
                right: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  UserName(),
                  CategoriesSlider(),
                  DeliveryType(),
                  Gifts(),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
