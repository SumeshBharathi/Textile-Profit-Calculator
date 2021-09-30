import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_admob/flutter_native_admob.dart';
import 'package:flutter_native_admob/native_admob_controller.dart';
import 'package:textile_calculator/popUpResult.dart';

import 'exitRate.dart';
import 'variables.dart';
import 'widgets.dart';
import 'dart:async';

TextEditingController priceOfWeptBag;
TextEditingController priceOfWarpBag;

class WarpScreen extends StatefulWidget {
  @override
  _WarpScreenState createState() => _WarpScreenState();
}

class _WarpScreenState extends State<WarpScreen> {
  var _nativeAdController = NativeAdmobController();

  StreamSubscription _subscription;
  double _height = 0;

  @override
  void initState() {
    // TODO: implement initState
    _subscription = _nativeAdController.stateChanged.listen(_onStateChanged);
    _nativeAdController.setTestDeviceIds([
      "B162670250D04AEA413055CB92B31B08",
    ]);
    super.initState();
    getValue();
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
          print("Not Loaded");
        });
        break;

      case AdLoadState.loadCompleted:
        setState(() {
          _height = 250;
          print("Loaded");
        });
        break;

      default:
        break;
    }
  }

  getValue() async {
    await storage.ready;
    List storageList = storage.getItem('*%^@!%%%K.dgW');
    print(storageList.toString());
    setState(() {
      if (storageList != null) {
        clothPicVar = storageList[0]['clothPicVar'];
        clothWidthVar = storageList[0]['clothWidthVar'];
        loomChargeVar = storageList[0]['loomChargeVar'];
        otherChargesVar = storageList[0]['otherChargesVar'];
        warpSizingCharge = storageList[0]['warpSizingCharge'];
        warpBagWeight = storageList[0]['warpBagWeight'];
        warpTotalThreads = storageList[0]['warpTotalThreads'];
        warpCount = storageList[0]['warpCount'];
      } else {}
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height - 80,
          width: MediaQuery.of(context).size.width,
          // color: Colors.red,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                // height: MediaQuery.of(context).size.height - 80 - 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: Color(0xffd5efdd),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        itemWidget('Cloth\nPic',
                                            clothPicVar.toString()),
                                        itemWidget('Cloth\nWidth',
                                            clothWidthVar.toString() + " inch"),
                                        itemWidget('Loom\nCharge',
                                            '₹ ' + loomChargeVar.toString()),
                                        itemWidget('Other\nCharges',
                                            '₹ ' + otherChargesVar.toString()),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: Color(0xfff4e3e3),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        // itemWidget('Weight',
                                        //     warpBagWeight.toString() + ' Kg'),
                                        itemWidget('Sizing\ncharge',
                                            '₹ ' + warpSizingCharge.toString()),
                                        itemWidget('Warp\nthreads',
                                            warpTotalThreads.toString()),
                                        itemWidget('Warp\nCount',
                                            warpCount.toString()),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Container(
                                    width: 150.0,
                                    child: Text(
                                      'Warp Rate (Kg)',
                                      style: TextStyle(fontSize: 18.0),
                                    )),
                                Container(
                                  width: 170.0,
                                  height: 50.0,
                                  child: TextField(
                                    enableInteractiveSelection: false,
                                    controller: priceOfWarpBag,
                                    keyboardType: TextInputType.number,
                                    textInputAction: TextInputAction.next,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderSide:
                                            new BorderSide(color: Colors.blue),
                                      ),
                                      labelText: 'Rate ',
                                    ),
                                    onChanged: (data) {
                                      warpKg = double.parse(data);
                                    },
                                    onSubmitted: (data) {
                                      FocusScope.of(context).unfocus();
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Container(
                                    width: 150.0,
                                    child: Text(
                                      'Wept Rate (Kg)',
                                      style: TextStyle(fontSize: 18.0),
                                    )),
                                Container(
                                  width: 170.0,
                                  height: 50.0,
                                  child: TextField(
                                    enableInteractiveSelection: false,
                                    onChanged: (data) {
                                      weptKg = double.parse(data);
                                    },
                                    keyboardType: TextInputType.number,
                                    textInputAction: TextInputAction.next,
                                    onSubmitted: (data) {
                                      FocusScope.of(context).unfocus();
                                    },
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderSide:
                                            new BorderSide(color: Colors.blue),
                                      ),
                                      labelText: 'Rate',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              // width: 200.0,
                              decoration: BoxDecoration(
                                color: Colors.blue[400],
                                borderRadius: BorderRadius.circular(6.0),
                              ),
                              child: TextButton(
                                child: Text(
                                  ' Calculate ',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18.0),
                                ),
                                onPressed: () {
                                  double totalWarp =
                                      ((((((((warpKg) + warpSizingCharge) *
                                                              0.639) *
                                                          warpTotalThreads) /
                                                      warpCount) *
                                                  45) /
                                              43) /
                                          1000);
                                  double totalWept = (((weptKg * 50) *
                                              ((clothPicVar * clothWidthVar) /
                                                  768)) /
                                          330) /
                                      10;
                                  //RoundOff - Warp
                                  String roundOfWarp =
                                      totalWarp.toStringAsFixed(2);
                                  totalWarp = double.parse(roundOfWarp);
                                  //RoundOff - Warp
                                  String roundOfWept =
                                      totalWept.toStringAsFixed(2);
                                  totalWept = double.parse(roundOfWept);

                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return PopUpScreen(
                                          totalWarp,
                                          totalWept,
                                          clothPicVar,
                                          loomChargeVar,
                                          otherChargesVar);
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 250,
                child: NativeAdmob(
                  // Your ad unit id
                  adUnitID: adUnitId,
                  controller: _nativeAdController,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

WarpScreen obj;
