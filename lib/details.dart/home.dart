import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/resources/app.bottomNavigationBar.dart';
import 'package:to_do_list/resources/button.dart';
import 'package:to_do_list/resources/text.dart';

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
              padding: EdgeInsets.only(right: 17, top: 10),
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
                          color: Theme.of(context).accentColor),
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
        bottomNavigationBar: BottomNavigatorBarInApp(activeIndex: 1));
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
            constraints:
                BoxConstraints(minHeight: viewportConstraints.maxHeight),
            child: Padding(
              padding: EdgeInsets.only(top: 10, left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CustomText(
                      text: "Good morning",
                      style: Theme.of(context).textTheme.caption),
                  CustomText(
                      text: "Kurnia Satria. H",
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          .copyWith(fontWeight: FontWeight.bold)),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                    child: WidgetSlider(),
                  ),
                  StackedWidget(),
                  CardBoxes(),
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

class WidgetSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        aspectRatio: 1.8,
        items: [1, 2, 3, 4, 5].map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Card(
                  elevation: 0,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    decoration: BoxDecoration(
                        // image: DecorationImage(
                        //   image: AssetImage('assets/ex-1.png'),
                        //   fit: BoxFit.cover
                        // ),
                        color: Theme.of(context).accentColor,
                        borderRadius: BorderRadius.circular(15)),
                    width: MediaQuery.of(context).size.width - 100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Promotion",
                          style: Theme.of(context).textTheme.headline6.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColorLight),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5),
                          child: Text(
                            "Get the latest info about this",
                            style: Theme.of(context).textTheme.caption.copyWith(
                                color: Theme.of(context).primaryColorLight),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 15),
                          child: Container(
                              height: 30,
                              child: CustomRaisedButton(
                                radius: 12,
                                color: Theme.of(context).textSelectionColor,
                                function: () {},
                                child: FittedBox(
                                  fit: BoxFit.fitHeight,
                                  child: Text(
                                    "Show more",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.white),
                                  ),
                                ),
                                borderColor: Color(0x00000000),
                                splashColor:
                                    Theme.of(context).primaryColorLight,
                              )),
                        )
                      ],
                    ),
                  ));
            },
          );
        }).toList());
  }
}

class ChooseDelivery extends StatefulWidget {
  ChooseDeliveryState createState() => ChooseDeliveryState();
}

class ChooseDeliveryState extends State<ChooseDelivery> {
  String activeButton = 'delivery';

  setStateButton(ki) {
    print("Clicks");
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
                  color:
                      activeButton == 'delivery' ? activeColor : inactiveColor,
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
                  borderColor: activeButton == 'pick'
                      ? activeColor
                      : inactiveBorderColor,
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
            ]));
  }
}

class StackedWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 250,
      child: Stack(
        children: <Widget>[
          Positioned(top: 25, child: CurrentAddress()),
          Positioned(
            top: 0,
            child: ChooseDelivery(),
          )
        ],
      ),
    );
  }
}

class CurrentAddress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 40,
      padding: EdgeInsets.fromLTRB(20, 40, 20, 30),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Theme.of(context).primaryColorLight),
      child: Column(
        children: <Widget>[
          ListTile(
            contentPadding: EdgeInsets.only(top: 10, bottom: 5),
            leading: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(8)),
                  child: Icon(Icons.location_on),
                ),
              ],
            ),
            title: Text("pick your order at",
                style: Theme.of(context).textTheme.caption),
            subtitle: Text(
              "Your Address",
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  .copyWith(fontWeight: FontWeight.bold),
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
                child: Text("Order now",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2
                        .copyWith(color: Theme.of(context).primaryColorLight)),
              ))
        ],
      ),
    );
  }
}

class CardBoxes extends StatefulWidget {
  CardBoxesState createState() => CardBoxesState();
}

class CardBoxesState extends State<CardBoxes> {
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
            child: CardBoxItem(
                title: "Felicidades",
                icon: Icons.card_giftcard,
                function: () {})),
        Expanded(
            child: CardBoxItem(
                title: "Coupons", icon: Icons.turned_in, function: () {})),
        Expanded(
            child: CardBoxItem(
                title: "Quick Scan", icon: Icons.blur_on, function: () {})),
      ],
    );
  }
}

class CardBoxItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function function;

  CardBoxItem({this.title, this.icon, this.function});
  @override
  Widget build(BuildContext context) {
    return Card(
        color: Theme.of(context).primaryColorLight,
        elevation: 0,
        child: InkWell(
          splashColor: Theme.of(context).accentColor,
          highlightColor: Theme.of(context).textSelectionColor,
          child: Padding(
            padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
            child: Column(
              children: <Widget>[
                Icon(
                  icon,
                  size: 42,
                  color: Theme.of(context).accentColor,
                ),
                Padding(
                    padding: EdgeInsets.only(top: 4),
                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(title),
                    )),
              ],
            ),
          ),
          onTap: function, //Click
        ));
  }
}
