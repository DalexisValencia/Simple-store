import 'package:flutter/material.dart';
import 'package:flutter_first_app/Screen/Details/details.dart';
import 'package:flutter_first_app/Screen/Home/home.dart';
import 'package:flutter_first_app/Screen/Products/products.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColorLight: Color(0xffffffff), //Blanco
        primaryColor: const Color(0xfff1f3fc), //Gris
        accentColor: const Color(0xffFF416E), //purpura
        focusColor: const Color(0xffa02a4c), //dark purpure
        textSelectionColor: const Color(0xff64dcbe), //verde claro
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/products': (context) => ProductsPage(),
        '/detail': (context) => DetailPage()
      },
    );
  }
}
