import 'package:flutter/material.dart';

Widget itemWidget(String lVal, String rVal) {
  return Padding(
    padding: const EdgeInsets.all(5.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
            alignment: Alignment.center,
            child: Text(
              lVal,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
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
