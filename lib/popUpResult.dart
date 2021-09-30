import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_native_admob/flutter_native_admob.dart';
import 'package:flutter_native_admob/native_admob_controller.dart';
import 'package:textile_calculator/variables.dart';
import 'package:textile_calculator/widgets.dart';

class PopUpScreen extends StatefulWidget {
  final totalWarp, totalWept, clothPicVar, loomChargeVar, otherChargesVar;
  PopUpScreen(this.totalWarp, this.totalWept, this.clothPicVar,
      this.loomChargeVar, this.otherChargesVar);
  @override
  _PopUpScreenState createState() => _PopUpScreenState();
}

class _PopUpScreenState extends State<PopUpScreen> {
  final _nativeAdController = NativeAdmobController();
  StreamSubscription _subscription;
  double _height, _popUpHeight = 250, sizedBoxHeight = 0;

  @override
  void initState() {
    // TODO: implement initState
    _subscription = _nativeAdController.stateChanged.listen(_onStateChanged);
    super.initState();
  }

  @override
  void dispose() {
    _subscription.cancel();
    _nativeAdController.dispose();
    super.dispose();
  }

  void _onStateChanged(AdLoadState state) {
    switch (state) {
      case AdLoadState.loading:
        setState(() {
          _height = 0;
          _popUpHeight = 250;
          sizedBoxHeight = 0;
          print("Not Loaded");
        });
        break;

      case AdLoadState.loadCompleted:
        setState(() {
          _height = 450;
          _popUpHeight = 400;
          sizedBoxHeight = 10;
          print("Loaded");
        });
        break;

      default:
        break;
    }
  }

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
        height: 650,
        width: MediaQuery.of(context).size.width - 50,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              '₹ ' +
                  (widget.totalWept +
                          widget.totalWarp +
                          (widget.clothPicVar * widget.loomChargeVar) +
                          widget.otherChargesVar)
                      .toStringAsFixed(2),
              style: TextStyle(fontSize: 45.0),
            ),
            SizedBox(
              height: 20.0,
            ),
            Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      itemWidget("Warp", '₹ ' + widget.totalWarp.toString()),
                      itemWidget("Wept", '₹ ' + widget.totalWept.toString()),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      itemWidget("Loom charge\n( / pic )",
                          '₹ ' + widget.loomChargeVar.toString()),
                      itemWidget("Other\ncharges",
                          '₹ ' + widget.otherChargesVar.toString()),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: sizedBoxHeight,
            ),
            Container(
              height: 300,
              child: NativeAdmob(
                // Your ad unit id
                adUnitID: adUnitId,
                controller: _nativeAdController,
              ),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
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
