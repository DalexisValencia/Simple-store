import 'package:flutter/material.dart';
import 'package:flutter_first_app/Screen/Products/ProductList/products__list.dart';
import 'package:flutter_first_app/Screen/Products/products__search.dart';
import 'package:flutter_first_app/Screen/Products/products__tagCategory.dart';
import 'package:flutter_first_app/Widget/actionBar.dart';
import 'package:flutter_first_app/Widget/bottomNavigationBar.dart';

class ProductsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        elevation: 0,
        leading: Icon(
          Icons.menu,
        ),
        actions: <Widget>[
          ActionBarUser(),
        ],
      ),
      body: ProductsPageContainer(),
      bottomNavigationBar: BottomNavigatorBarInApp(
        activeIndex: 2,
      ),
    );
  }
}

class ProductsPageContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: viewportConstraints.minHeight,
            ),
            child: Container(
              height: MediaQuery.of(context).size.height - 130,
              child: Column(
                children: <Widget>[
                  ProductSearch(),
                  CategoriesFilter(),
                  SizedBox(height: 15),
                  Expanded(
                    child: ProductsList(),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
