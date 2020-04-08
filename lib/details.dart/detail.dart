import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:to_do_list/resources/app.bottomNavigationBar.dart';
import 'package:to_do_list/resources/button.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
         value: SystemUiOverlayStyle.light,                
         child: DetailPageScaffold(),
      ),
      bottomNavigationBar: BottomNavigatorBarInApp(activeIndex: 3,),
    );
  }


}

class DetailPageScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints viewPortContraints){
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: viewPortContraints.minHeight
            ),
            child: Container(
              height: MediaQuery.of(context).size.height - 50,
              color: Colors.blue,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.red,
                        image: DecorationImage(
                          image: new AssetImage('assets/detail-coffee.png'),
                          fit: BoxFit.fill
                        )
                      ),
                      height: (MediaQuery.of(context).size.height / 3) + 50,
                      width: MediaQuery.of(context).size.width,
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            top: 30,
                            left: 20,
                            child: Container(
                              width: 40,
                              height: 40,
                              child: CustomRaisedButton(
                                radius:50,
                                color: Theme.of(context).primaryColor,
                                function: (){
                                  Navigator.of(context).pop();
                                },
                                splashColor:Theme.of(context).textSelectionColor,
                                child: Icon(
                                    Icons.arrow_back,
                                    color: Colors.black87,
                                ) ,
                                borderColor: Theme.of(context).primaryColor,
                                padding: EdgeInsets.all(0),
                              ),
                            )
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: (MediaQuery.of(context).size.height / 3),
                    child:  Container(
                      decoration: BoxDecoration(
                      color: Theme.of(context).primaryColorLight,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)
                      )
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
                          ]
                        ),
                      ),
                    )
                  )
                ],
              ),
            ),
          )
        );
      },
    );
  }
}

class TitleAndDescription extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(25,35,25,5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          FittedBox(
            fit: BoxFit.fitWidth,
            child: Text(
              "Sip and savor browish boba thst tea",
              style: Theme.of(context).textTheme.subhead.copyWith(fontWeight: FontWeight.w700),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top:10),
            child: Text(
              "Original buble that tea width brown caramel nd brown low calories sugar",
              style: Theme.of(context).textTheme.caption.copyWith(color: Colors.grey[500]),)
          ),
        ],
      ),
    );
  }
}

class AmountProducts extends StatefulWidget {
  @override
  _AmountProductsState createState() => _AmountProductsState();
}

class _AmountProductsState extends State<AmountProducts> {
  int values = 1;
  void addItem(){
    setState(() {
      values++;
    });
  }

  void removeItem(){
    if( values >= 1){
      setState(() {
        values--;
      });
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(25, 10, 25, 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "Item", 
            style: Theme.of(context).textTheme.subhead.copyWith(fontWeight: FontWeight.bold),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  width: 40,
                  height: 40,
                  child: CustomRaisedButton(
                    radius:12,
                    color: Theme.of(context).primaryColor,
                    function: () => removeItem(),
                    splashColor: Theme.of(context).textSelectionColor,
                    child: Icon(
                      Icons.remove,
                      size: 14
                    ),
                    borderColor: Theme.of(context).primaryColor,
                    padding:EdgeInsets.all(0),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left:25, right:25),
                  child: Text("$values"),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  width: 40,
                  height: 40,
                  child: CustomRaisedButton(
                    radius:12,
                    color: Theme.of(context).primaryColor,
                    function: () => addItem(),
                    splashColor: Theme.of(context).textSelectionColor,
                    child: Icon(
                      Icons.add,
                      size: 14
                    ),
                    borderColor: Theme.of(context).primaryColor,
                    padding:EdgeInsets.all(0),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class SelectedSize extends StatefulWidget {
  @override
  _SelectedSizeState createState() => _SelectedSizeState();
}

class _SelectedSizeState extends State<SelectedSize> {
  List<String> sizes = ['Medium', 'Large'];
  String size = "Large";

  void selectSized(sized){
    setState(() {
      size = sized;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(25, 15, 25, 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "Size",
            style: Theme.of(context).textTheme.subhead.copyWith(fontWeight:FontWeight.bold),
          ),
          Container(
            child: Row(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width / 1.5,
                  height: 50,
                  child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: sizes.length,
                  itemBuilder: (BuildContext context, int index){
                    var title = sizes[index];
                    return Padding(
                      padding: EdgeInsets.only(left:15),
                      child: CustomRaisedButton(
                        radius:12,
                        color: size == title ? Theme.of(context).textSelectionColor : Theme.of(context).primaryColorLight,
                        function: () => selectSized(title),
                        splashColor: size == title ? Theme.of(context).primaryColorLight : Theme.of(context).textSelectionColor,
                        child: Text(
                        title,
                        style: TextStyle(
                          color: size == title ? Theme.of(context).primaryColorLight : Theme.of(context).textSelectionColor
                        ),
                        ),
                        borderColor: size == title ? Theme.of(context).textSelectionColor : Theme.of(context).primaryColor,
                        padding: EdgeInsets.fromLTRB(30,15, 30, 15),
                      )
                    ); 
                    
                  },
                ),
              )
              ],
            ),
          )
        ],
      )
    );  
  }
}

class AddTopping extends StatefulWidget {
  @override
  _AddToppingState createState() => _AddToppingState();
}

class _AddToppingState extends State<AddTopping> {
  List<String> topping = ['Sugar', 'Milk', 'Pearl', 'Jelly', 'Red Bean', 'Cheese'];
  String active = "Sugar";

  void setActiveTopping(toppingValue){
    setState(() {
      active = toppingValue;
    });
  } 
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top:10, left: 25),
      height:100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Topping",
            style: Theme.of(context).textTheme.subhead.copyWith(fontWeight: FontWeight.bold)
          ),
          Container(
            padding: EdgeInsets.only(top:10),
            height: 60,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: topping.length,
              itemBuilder: (BuildContext context, int index){
                var currentTitle = topping[index];
                return Padding(
                  padding: EdgeInsets.only(right:12),
                  child: CustomRaisedButton(
                    radius:12,
                    color: currentTitle == active ? Theme.of(context).textSelectionColor : Theme.of(context).primaryColorLight,
                    function: () => setActiveTopping(currentTitle),
                    splashColor: currentTitle == active ? Theme.of(context).primaryColorLight : Theme.of(context).textSelectionColor,
                    child: Text(
                    "${topping[index]}",
                    style: TextStyle(
                      color: currentTitle == active ? Theme.of(context).primaryColorLight : Theme.of(context).textSelectionColor
                    ),
                    ),
                    borderColor: currentTitle == active ? Theme.of(context).textSelectionColor : Theme.of(context).primaryColor,
                    padding: EdgeInsets.fromLTRB(30,15, 30, 15),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class AddNote extends StatefulWidget {
  @override
  _AddNoteState createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  final formSearchKey = GlobalKey<FormState>();
  TextEditingController addNoteController;
  FocusNode noteFocus;
  void initState(){
    super.initState();
    addNoteController = TextEditingController();
    noteFocus = FocusNode();
  }

  void addNote(note){
    print("remove focus in addNote");
    FocusScope.of(context).requestFocus(new FocusNode());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20,15,20,25),
        child: Form(
          key: formSearchKey,
          child: TextFormField(
            focusNode: noteFocus,
            onFieldSubmitted: (val) => addNote(val),
            controller: addNoteController,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
              hintText: 'add Note',
              hintStyle: TextStyle(
                fontSize: 11
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12)
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(width: 2, color: Colors.grey[300])
              )
            ),
          ),
        )
    );
  }
}

class SummaryProduct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25)
        )
      ),
      padding: EdgeInsets.fromLTRB(20, 23, 20, 23),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: <Widget>[
              Text(
                "Total",
                style: Theme.of(context).textTheme.subhead.copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                "15.8",
                style: Theme.of(context).textTheme.title.copyWith(
                  color: Theme.of(context).textSelectionColor,
                  fontSize: 23
                ),
              )
            ],
          ),
          Container(
            child: CustomRaisedButton(
              radius:12,
              color: Theme.of(context).accentColor,
              function: (){ print("Añadir al carrito"); },
              splashColor: Theme.of(context).primaryColorLight,
              child: Text( "Add to order",
                style: TextStyle(
                  color: Theme.of(context).primaryColorLight
                ),
              ),
              borderColor: Theme.of(context).accentColor,
              padding: EdgeInsets.fromLTRB(30,15, 30, 15),
            ),
          )
        ],
      )
    );
  }
}