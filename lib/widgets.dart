import 'package:flutter/material.dart';

Widget itemWidget(String lVal, String rVal){
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Container(
          width: 210.0,
            child: Text(lVal, style: TextStyle(fontSize: 20.0),)
        ),
        SizedBox(width: 30.0,),
        Text(rVal, style: TextStyle(fontSize: 20.0),),

      ],
    ),
  );
}
