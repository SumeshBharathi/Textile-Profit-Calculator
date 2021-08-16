import 'package:flutter/material.dart';

Widget itemWidget(String lVal, String rVal) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
            child: Text(
          lVal,
          style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
        )),
        SizedBox(
          height: 10.0,
        ),
        Text(
          rVal,
          style: TextStyle(fontSize: 18.0),
        ),
      ],
    ),
  );
}
