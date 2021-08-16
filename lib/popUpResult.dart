import 'package:flutter/material.dart';
import 'package:textile_calculator/widgets.dart';

class PopUpScreen extends StatefulWidget {
  final totalWarp, totalWept, clothPicVar, loomChargeVar, otherChargesVar;
  PopUpScreen(this.totalWarp, this.totalWept, this.clothPicVar,
      this.loomChargeVar, this.otherChargesVar);
  @override
  _PopUpScreenState createState() => _PopUpScreenState();
}

class _PopUpScreenState extends State<PopUpScreen> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Net Total',
            style: TextStyle(fontSize: 38.0, color: Colors.blue),
            textAlign: TextAlign.center,
          ),
          Text(
            ' / mtr',
            style: TextStyle(color: Colors.blue),
          )
        ],
      ),
      content: Container(
        height: 280.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '₹ ' +
                  (widget.totalWept +
                          widget.totalWarp +
                          (widget.clothPicVar * widget.loomChargeVar) +
                          widget.otherChargesVar)
                      .toStringAsFixed(2),
              style: TextStyle(fontSize: 40.0),
            ),
            SizedBox(
              height: 50.0,
            ),
            Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      itemWidget(
                          "Warp\n/ mtr", '₹ ' + widget.totalWarp.toString()),
                      itemWidget(
                          "Wept\n/ mtr", '₹ ' + widget.totalWept.toString()),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      itemWidget("Loom\ncharge",
                          '₹ ' + widget.loomChargeVar.toString()),
                      itemWidget("Other\ncharges",
                          '₹ ' + widget.otherChargesVar.toString()),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text(
            'Close',
            style: TextStyle(fontSize: 18.0, color: Colors.red),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        )
      ],
    );
  }
}
