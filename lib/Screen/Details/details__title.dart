import 'package:flutter/material.dart';

class TitleAndDescription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(25, 35, 25, 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          FittedBox(
            fit: BoxFit.fitWidth,
            child: Text(
              "Sip and savor browish boba thst tea",
              style: Theme.of(context).textTheme.subtitle1.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                "Original buble that tea width brown caramel nd brown low calories sugar",
                style: Theme.of(context).textTheme.caption.copyWith(
                      color: Colors.grey[500],
                    ),
              )),
        ],
      ),
    );
  }
}
