import 'package:flutter/material.dart';
import 'package:to_do_list/details.dart/detail.dart';
import 'package:to_do_list/details.dart/home.dart';
import 'package:to_do_list/details.dart/products.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColorLight: Color(0xffffffff),//Blanco
        primaryColor: const Color(0xfff1f3fc),//Gris
        accentColor: const Color(0xffFF416E),//purpura
        focusColor: const Color(0xffa02a4c),//dark purpure
        textSelectionColor: const Color(0xff64dcbe),//verde claro
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