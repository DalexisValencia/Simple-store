import 'package:flutter/material.dart';

class ProductSearch extends StatefulWidget {
  @override
  _ProductSearchState createState() => _ProductSearchState();
}

class _ProductSearchState extends State<ProductSearch> {
  TextEditingController _controllerSearch;

  void initState() {
    super.initState();
    _controllerSearch = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: TextField(
        onSubmitted: (string) {},
        controller: _controllerSearch,
        textAlign: TextAlign.start,
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: EdgeInsets.only(
              left: 20,
            ),
            child: Icon(
              Icons.search,
            ),
          ),
          //contentPadding: EdgeInsets.only(left: 30, right: 20, top: 20),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: new BorderSide(
              width: 2,
              color: Colors.red,
            ),
          ),
          labelText: 'Search here',
        ),
      ),
    );
  }
}
