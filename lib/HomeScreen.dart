import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:textile_calculator/popUpResult.dart';
import 'package:textile_calculator/settingsScreen.dart';
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
  void refresh() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // var refState = storage.getItem('*%^@!%%%K.dgW');
    // Timer(Duration(seconds: 2), () {
    //   print(refState);
    //   setState(() {
    //     if (refState != null) {
    //       clothPicVar = clothPicVar;
    //       clothWidthVar = refState[0]['clothWidthVar'];
    //       loomChargeVar = refState[0]['loomChargeVar'];
    //       otherChargesVar = refState[0]['otherChargesVar'];
    //       warpSizingCharge = refState[0]['warpSizingCharge'];
    //       warpBagWeight = refState[0]['warpBagWeight'];
    //       warpCount = refState[0]['warpCount'];
    //       print(warpCount);
    //     } else {}
    //   });
    // });
  }

  getValue() async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // //Return String
    // String stringValue = prefs.getString('list');
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
  void initState() {
    // TODO: implement initState
    super.initState();
    getValue();
  }

  @override
  Widget build(BuildContext context) {
    // print(storage.getItem('*%^@!%%%K.dgW'));
    // getValue();
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height - 80,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Color(0xffd5efdd),
                            borderRadius: BorderRadius.circular(16)),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  itemWidget(
                                      'Cloth\nPic', clothPicVar.toString()),
                                  itemWidget(
                                      'Cloth\nWidth', clothWidthVar.toString()),
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
                    Container(
                      height: 13,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Container(
                              width: 150.0,
                              child: Text(
                                'Warp rate (Kg)',
                                style: TextStyle(fontSize: 18.0),
                              )),
                          Container(
                            width: 170.0,
                            height: 50.0,
                            child: TextField(
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
                    Container(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Color(0xfff4e3e3),
                            borderRadius: BorderRadius.circular(16)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  itemWidget('Weight',
                                      warpBagWeight.toString() + ' Kg'),
                                  itemWidget('Sizing\ncharge',
                                      '₹ ' + warpSizingCharge.toString()),
                                  itemWidget('Warp\nthreads',
                                      warpTotalThreads.toString()),
                                  itemWidget(
                                      'Warp\nCount', warpCount.toString()),
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
                      padding: const EdgeInsets.all(8.0),
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
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color(0xfff4e3e3),
                            borderRadius: BorderRadius.circular(16)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              itemWidget(
                                  'Wept Thread', weptThread.toStringAsFixed(3)),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        // width: 200.0,
                        decoration: BoxDecoration(
                          color: Colors.blue[400],
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: TextButton(
                          child: Text(
                            ' Calculate ',
                            style:
                                TextStyle(color: Colors.white, fontSize: 20.0),
                          ),
                          onPressed: () {
                            double totalWarp =
                                ((((((((warpKg) + warpSizingCharge) * 0.639) *
                                                    warpTotalThreads) /
                                                warpCount) *
                                            45) /
                                        43) /
                                    1000);
                            double totalWept = (((weptKg * 50) *
                                        ((clothPicVar * clothWidthVar) / 768)) /
                                    330) /
                                10;
                            //RoundOff - Warp
                            String roundOfWarp = totalWarp.toStringAsFixed(2);
                            totalWarp = double.parse(roundOfWarp);
                            //RoundOff - Warp
                            String roundOfWept = totalWept.toStringAsFixed(2);
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
                    )
                  ],
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
