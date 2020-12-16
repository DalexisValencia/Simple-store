import 'package:flutter/material.dart';
import 'package:flutter_first_app/Models/products.dart';

class ListTileItem extends StatelessWidget {
  final ModelProducts product;
  final bool active;
  final Function onActive;
  ListTileItem({
    this.product,
    this.active,
    this.onActive,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: FittedBox(
        fit: BoxFit.fill,
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              image: new AssetImage(
                'assets/thumbnail-default.png',
              ),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
      title: Text(
        product.name,
        style: Theme.of(context).textTheme.subtitle1.copyWith(
              fontWeight: FontWeight.w700,
            ),
      ),
      subtitle: Text(
        '${product.price}',
        style: TextStyle(
          color: Theme.of(context).textSelectionColor,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: FittedBox(
        fit: BoxFit.fitHeight,
        child: InkWell(
          onTap: () => onActive(),
          child: Container(
            child: Icon(
              active ? Icons.delete : Icons.add,
              color:
                  active ? Theme.of(context).primaryColorLight : Colors.black45,
            ),
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: active
                  ? Theme.of(context).accentColor
                  : Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
    );
  }
}
