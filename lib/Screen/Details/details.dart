import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_first_app/Screen/Details/details__amount.dart';
import 'package:flutter_first_app/Screen/Details/details__image.dart';
import 'package:flutter_first_app/Screen/Details/details__note.dart';
import 'package:flutter_first_app/Screen/Details/details__size.dart';
import 'package:flutter_first_app/Screen/Details/details__summary.dart';
import 'package:flutter_first_app/Screen/Details/details__title.dart';
import 'package:flutter_first_app/Screen/Details/details__topping.dart';
import 'package:flutter_first_app/Widget/bottomNavigationBar.dart';
import 'package:flutter_first_app/Widget/button.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: DetailPageScaffold(),
      ),
      bottomNavigationBar: BottomNavigatorBarInApp(
        activeIndex: 3,
      ),
    );
  }
}

class DetailPageScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints viewPortContraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: viewPortContraints.minHeight,
            ),
            child: Container(
              height: MediaQuery.of(context).size.height - 50,
              color: Colors.blue,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 0,
                    child: DetailsImage(),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height / 3,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColorLight,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      height: MediaQuery.of(context).size.height / 1.7,
                      width: MediaQuery.of(context).size.width,
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            TitleAndDescription(),
                            AmountProducts(),
                            SelectedSize(),
                            AddTopping(),
                            AddNote(),
                            SummaryProduct()
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
