import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_first_app/Lists/Categories.dart';
import 'package:flutter_first_app/Widget/button.dart';

class CategoriesSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
      child: CarouselSlider(
        aspectRatio: 1.8,
        items: homeCategories.map((category) {
          return Builder(
            builder: (BuildContext context) {
              return Card(
                elevation: 0,
                child: Container(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  decoration: BoxDecoration(
                    // image: DecorationImage(
                    //   image: AssetImage('assets/ex-1.png'),
                    //   fit: BoxFit.cover,
                    // ),
                    color: category.cardColor == 'primary'
                        ? Theme.of(context).accentColor
                        : Theme.of(context).textSelectionColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  width: MediaQuery.of(context).size.width - 100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        category.name,
                        style: Theme.of(context).textTheme.headline6.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColorLight,
                            ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 5,
                        ),
                        child: Text(
                          category.description,
                          style: Theme.of(context).textTheme.caption.copyWith(
                                color: Theme.of(context).primaryColorLight,
                              ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 15,
                        ),
                        child: Container(
                          height: 30,
                          child: CustomRaisedButton(
                            radius: 12,
                            color: category.cardColor == 'primary'
                                ? Theme.of(context).textSelectionColor
                                : Theme.of(context).accentColor,
                            function: () {},
                            child: FittedBox(
                              fit: BoxFit.fitHeight,
                              child: Text(
                                "Show more",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            borderColor: Color(0x00000000),
                            splashColor: Theme.of(context).primaryColorLight,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}
