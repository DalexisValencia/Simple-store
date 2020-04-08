import 'package:flutter/material.dart';
import 'package:to_do_list/models/products.dart';
import 'package:to_do_list/resources/actions.appbar.dart';
import 'package:to_do_list/resources/app.bottomNavigationBar.dart';

class ProductsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Theme.of(context).primaryColor,
      appBar: AppBar(
        elevation: 0,
        leading: Icon(
          Icons.menu
        ),
        actions: <Widget>[
          ActionBarUser()
        ],
      ),
      body: ProductsPageContainer(),
      bottomNavigationBar: BottomNavigatorBarInApp(activeIndex:2)
    );
  }
}

class ProductsPageContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints  viewportConstraints){
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: viewportConstraints.minHeight
            ),
            child: 
            Container(
              height: MediaQuery.of(context).size.height - 130,
              child: Column(
                children: <Widget>[
                  SearcHere(),
                  CategoriesFilter(),
                  SizedBox( height: 15 ),
                  Expanded(
                    child: ProductsListTile()
                  ),
                ],
              ),
            )
          ),
        );
      },
    );
  }
}

class SearcHere extends StatefulWidget {
  @override
  _SearcHereState createState() => _SearcHereState();
}

class _SearcHereState extends State<SearcHere> {
  TextEditingController _controllerSearch;

  void initState(){
    super.initState();
    _controllerSearch = TextEditingController();  
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left:20, right:20, top: 20, bottom: 20),
      child: TextField(
        onSubmitted: (string){

        },
        controller: _controllerSearch,
        textAlign: TextAlign.start,
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: EdgeInsets.only(left: 20),
            child: Icon(Icons.search),
          ),
          //contentPadding: EdgeInsets.only(left: 30, right: 20, top: 20),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: new BorderSide(width: 2, color: Colors.red)
          ),
          labelText: 'Search here',
        ),
      )
    );

  }
}

class CategoriesFilter extends StatefulWidget {
  @override
  CategoriesFilterState createState() => CategoriesFilterState();
}

class CategoriesFilterState extends State<CategoriesFilter> {
  int active = 1;

  List<String> categories = ['Drinks', 'Cake', 'Coffe', 'Beer', 'Snakes'];

  void setActive(index){
    setState(() {
      active = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20),
      height: 50,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index){
          return Padding(
            padding: EdgeInsets.only(right:10),
            child: RaisedButton(
              elevation: 0,
              color: active == index ? Theme.of(context).textSelectionColor : Theme.of(context).primaryColorLight,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12)
              ),
              onPressed: () => setActive(index),
              child:  Text(
                "${categories[index]}",
                style: TextStyle(
                  color: active == index ? Theme.of(context).primaryColorLight : Theme.of(context).textSelectionColor
                ),
              ),
            )
          ); 
        }
      )
    );
  }
}

/*::::::::::::::Listado de productos:::::::::::::: */
class ProductsListTile extends StatefulWidget {
  @override
  _ProductsListTileState createState() => _ProductsListTileState();
}

class _ProductsListTileState extends State<ProductsListTile> {
  int active; 
  final List<ModelProducts> products = List.generate(
    10, 
    (i) => ModelProducts(
      img: 'thumbnail-default.png',
      name: 'El nombre del producto $i',
      price: '20.00'
    )
  );

  void addToCart(index){
    setState(() {
      active = active == index ? products.length + 1 : index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.fromLTRB(12,10,12,5),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColorLight,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20)
        )
      ),
      //height: MediaQuery.of(context).size.height - 300,
      child: ListView.builder(
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index){
          return ListTile(
            //leading: Icon(Icons.photo),
            leading: FittedBox(
              fit: BoxFit.fill,
                child: Container(
                  width: 50,
                  height: 50,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: new AssetImage('assets/thumbnail-default.png'),
                    fit: BoxFit.fill
                  )
                )
              ),
            ),
            title: Text( products[index].name, style: Theme.of(context).textTheme.subhead.copyWith(fontWeight: FontWeight.w700  )),
            subtitle: Text( '${products[index].price}',style: TextStyle( color: Theme.of(context).textSelectionColor, fontWeight: FontWeight.w500),),
            trailing: FittedBox(
              fit: BoxFit.fitHeight,
              child: InkWell(
                onTap: () => addToCart(index),
                child: Container(
                  child: Icon(
                     active == index ? Icons.delete : Icons.add,
                    color: active == index ? Theme.of(context).primaryColorLight : Colors.black45
                  ),
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: active == index ? Theme.of(context).accentColor : Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(8)
                  ),
                ),
              )
            ) ,
          );
        }
      ),
    );
  }
}