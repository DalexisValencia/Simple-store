import 'package:flutter/material.dart';
import 'package:flutter_first_app/Models/products.dart';
import 'package:flutter_first_app/Screen/Products/ProductList/list__card.dart';

class ProductsList extends StatefulWidget {
  @override
  _ProductsListState createState() => _ProductsListState();
}

class _ProductsListState extends State<ProductsList> {
  int active;
  final List<ModelProducts> products = List.generate(
    10,
    (i) => ModelProducts(
      img: 'thumbnail-default.png',
      name: 'Producto #$i',
      price: '20.00',
    ),
  );

  void addToCart(index) {
    setState(() {
      active = active == index ? products.length + 1 : index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(12, 10, 12, 5),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColorLight,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: ListView.builder(
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTileItem(
            product: products[index],
            active: active == index,
            onActive: () {
              addToCart(index);
            },
          );
        },
      ),
    );
  }
}
