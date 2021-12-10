import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_admob/flutter_native_admob.dart';
import 'package:flutter_native_admob/native_admob_controller.dart';
import 'package:localstorage/localstorage.dart';
// import 'package:textile_calculator/HomeScreen.dart';
// import 'package:textile_calculator/exitRate.dart';
// // import 'package:textile_calculator/settingsScreen.dart';
// import 'package:textile_calculator/updatePlayStore.dart';
// import 'variables.dart';
// import 'about.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:textile_calculator/updateScreen.dart';

final LocalStorage storage = new LocalStorage('*%^@!%%%K.dgW');
final LocalStorage ratingCountStorage = new LocalStorage('ratingCount');

bool rateFlag;

var version = 2.0, reqVersion = 0.0;

getRatingValue() async {
  await ratingCountStorage.ready;
  print('Get from Storage ' +
      ratingCountStorage.getItem('ratingCount').toString());

  if (ratingCountStorage.getItem('ratingCount').toString() == "true") {
    print("updated to true");
    rateFlag = true;
  } else {
    rateFlag = false;
  }
}

void main() {
  getRatingValue();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primaryColor: Colors.white),
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (!kDebugMode) {
      getAppUpdates();
    }
  }

  void refreshParentState() {
    setState(() {});
  }

  getAppUpdates() async {
    var url = Uri.https('gitgram-api.herokuapp.com',
        '/textileCalculatorupdates', {'q': '{https}'});

    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      setState(() {
        reqVersion = jsonResponse['urgent'];
      });
      print('Version urgent: $reqVersion.');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  @override
  Widget build(BuildContext context) {
    print(rateFlag);
    return Scaffold(
      body: Stack(alignment: Alignment.center, children: [
        WillPopScope(
          child: Scaffold(
            appBar: AppBar(
              title: Row(
                children: [
                  Text(
                    'Powerloom Calculator',
                    style: TextStyle(fontSize: 20),
                  ),
                  // Expanded(
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.end,
                  //     children: [
                  //       GestureDetector(
                  //         onTap: () {
                  //           // Navigator.push(
                  //           //     context,
                  //           //     MaterialPageRoute(
                  //           //         builder: (context) => Scaffold(
                  //           //             body: SettingsScreen(
                  //           //                 refreshParentState))));
                  //         },
                  //         child: Padding(
                  //           padding: const EdgeInsets.all(3.0),
                  //           child: Icon(Icons.settings),
                  //         ),
                  //       ),
                  //       GestureDetector(
                  //         onTap: () {
                  //           // Navigator.push(
                  //           //     context,
                  //           // MaterialPageRoute(
                  //           //     builder: (context) => Scaffold(
                  //           //         appBar: AppBar(
                  //           //           title: Text('About'),
                  //           //         ),
                  //           //         body: AboutPage(false))));
                  //         },
                  //         child: Padding(
                  //           padding: const EdgeInsets.all(3.0),
                  //           child: Icon(Icons.info_outline),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
              backgroundColor: Colors.black,
            ),
            body: HomeScreen(),
          ),
          onWillPop: () async {
            // if (rateFlag == true) {
            //   print("Exit requested");
            //   SystemChannels.platform.invokeMethod('SystemNavigator.pop');
            // } else {
            // print(rateFlag);
            // showDialog(
            //     context: context,
            //     builder: (BuildContext context) {
            //       return RateUs();
            //     });
            // }

            return false;
          },
        ),
        reqVersion > version ? UpdateApp() : Container(),
      ]),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var warpKg = 295.0,
      sizCharge = 19.0,
      thread = 3250,
      count = 41.0,
      tapeLength = 45.0;
  var weptKg = 185.0, bagKg = 50.0, pic = 56, width = 53.0, weptThread = 330;
  var labourCharge = 0.075, otherCharge = 0.25;

  TextEditingController warpKgC,
      sizChargeC,
      threadC,
      countC,
      tapeLengthC,
      weptKgC,
      bagKgC,
      picC,
      widthC,
      weptThreadC,
      labourChargeC,
      otherChargeC;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    checkStorage();
  }

  checkStorage() async {
    await storage.ready;

    if (storage.getItem('warpKg') != null) {
      warpKg = storage.getItem('warpKg');
    }

    if (storage.getItem('sizCharge') != null) {
      sizCharge = storage.getItem('sizCharge');
    }

    if (storage.getItem('thread') != null) {
      thread = storage.getItem('thread');
    }

    if (storage.getItem('count') != null) {
      count = storage.getItem('count');
    }

    if (storage.getItem('tapeLength') != null) {
      tapeLength = storage.getItem('tapeLength');
    }

    if (storage.getItem('weptKg') != null) {
      weptKg = storage.getItem('weptKg');
    }

    if (storage.getItem('bagKg') != null) {
      bagKg = storage.getItem('bagKg');
    }

    if (storage.getItem('pic') != null) {
      pic = storage.getItem('pic');
    }

    if (storage.getItem('width') != null) {
      width = storage.getItem('width');
    }

    print('width ' + storage.getItem('width').toString());
    print('weptThread ' + storage.getItem('weptThread').toString());

    if (storage.getItem('weptThread') != null) {
      weptThread = storage.getItem('weptThread');
    }

    if (storage.getItem('labourCharge') != null) {
      labourCharge = storage.getItem('labourCharge');
    }

    if (storage.getItem('otherCharge') != null) {
      otherCharge = storage.getItem('otherCharge');
    }

    setState(() {
      warpKgC = TextEditingController(text: warpKg.toString());
      sizChargeC = TextEditingController(text: sizCharge.toString());
      threadC = TextEditingController(text: thread.toString());
      countC = TextEditingController(text: count.toString());
      tapeLengthC = TextEditingController(text: tapeLength.toString());
      weptKgC = TextEditingController(text: weptKg.toString());
      bagKgC = TextEditingController(text: bagKg.toString());
      picC = TextEditingController(text: pic.toString());
      widthC = TextEditingController(text: width.toString());
      weptThreadC = TextEditingController(text: weptThread.toString());
      labourChargeC = TextEditingController(text: labourCharge.toString());
      otherChargeC = TextEditingController(text: otherCharge.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height - 80,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(3, 3, 3, 0),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(3)),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width - 28,
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Warp Rate / Kg'),
                                  Container(
                                    width: 200,
                                    height: 35,
                                    child: TextField(
                                      controller: warpKgC,
                                      enableInteractiveSelection: false,
                                      onChanged: (data) {
                                        warpKg = double.parse(data);
                                      },
                                      keyboardType: TextInputType.number,
                                      textInputAction: TextInputAction.next,
                                      onSubmitted: (data) {
                                        FocusScope.of(context).unfocus();
                                      },
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderSide: new BorderSide(
                                              color: Colors.blue),
                                        ),
                                        labelText: 'Warp Rate / Kg',
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width - 28,
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Sizing charge'),
                                  Container(
                                    width: 200,
                                    height: 35,
                                    child: TextField(
                                      controller: sizChargeC,
                                      enableInteractiveSelection: false,
                                      onChanged: (data) {
                                        sizCharge = double.parse(data);
                                      },
                                      keyboardType: TextInputType.number,
                                      textInputAction: TextInputAction.next,
                                      onSubmitted: (data) {
                                        FocusScope.of(context).unfocus();
                                      },
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderSide: new BorderSide(
                                              color: Colors.blue),
                                        ),
                                        labelText: 'Sizing charge',
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width - 28,
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Threads'),
                                  Container(
                                    width: 200,
                                    height: 35,
                                    child: TextField(
                                      controller: threadC,
                                      enableInteractiveSelection: false,
                                      onChanged: (data) {
                                        thread = int.parse(data);
                                      },
                                      keyboardType: TextInputType.number,
                                      textInputAction: TextInputAction.next,
                                      onSubmitted: (data) {
                                        FocusScope.of(context).unfocus();
                                      },
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderSide: new BorderSide(
                                              color: Colors.blue),
                                        ),
                                        labelText: 'Threads',
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width - 28,
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Count'),
                                  Container(
                                    width: 200,
                                    height: 35,
                                    child: TextField(
                                      controller: countC,
                                      enableInteractiveSelection: false,
                                      onChanged: (data) {
                                        count = double.parse(data);
                                      },
                                      keyboardType: TextInputType.number,
                                      textInputAction: TextInputAction.next,
                                      onSubmitted: (data) {
                                        FocusScope.of(context).unfocus();
                                      },
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderSide: new BorderSide(
                                              color: Colors.blue),
                                        ),
                                        labelText: 'Count',
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width - 28,
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Tape length'),
                                  Container(
                                    width: 200,
                                    height: 35,
                                    child: TextField(
                                      controller: tapeLengthC,
                                      enableInteractiveSelection: false,
                                      onChanged: (data) {
                                        tapeLength = double.parse(data);
                                      },
                                      keyboardType: TextInputType.number,
                                      textInputAction: TextInputAction.next,
                                      onSubmitted: (data) {
                                        FocusScope.of(context).unfocus();
                                      },
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderSide: new BorderSide(
                                              color: Colors.blue),
                                        ),
                                        labelText: 'Tape length',
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(3, 3, 3, 0),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(3)),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width - 28,
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Wept Rate / Kg'),
                                  Container(
                                    width: 200,
                                    height: 35,
                                    child: TextField(
                                      controller: weptKgC,
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
                                          borderSide: new BorderSide(
                                              color: Colors.blue),
                                        ),
                                        labelText: 'Wept Rate / Kg',
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width - 28,
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Bag weight Kg'),
                                  Container(
                                    width: 200,
                                    height: 35,
                                    child: TextField(
                                      controller: bagKgC,
                                      enableInteractiveSelection: false,
                                      onChanged: (data) {
                                        bagKg = double.parse(data);
                                      },
                                      keyboardType: TextInputType.number,
                                      textInputAction: TextInputAction.next,
                                      onSubmitted: (data) {
                                        FocusScope.of(context).unfocus();
                                      },
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderSide: new BorderSide(
                                              color: Colors.blue),
                                        ),
                                        labelText: 'Bag weight ',
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width - 28,
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Pic'),
                                  Container(
                                    width: 200,
                                    height: 35,
                                    child: TextField(
                                      controller: picC,
                                      enableInteractiveSelection: false,
                                      onChanged: (data) {
                                        pic = int.parse(data);
                                      },
                                      keyboardType: TextInputType.number,
                                      textInputAction: TextInputAction.next,
                                      onSubmitted: (data) {
                                        FocusScope.of(context).unfocus();
                                      },
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderSide: new BorderSide(
                                              color: Colors.blue),
                                        ),
                                        labelText: 'Pic',
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width - 28,
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Width'),
                                  Container(
                                    width: 200,
                                    height: 35,
                                    child: TextField(
                                      controller: widthC,
                                      enableInteractiveSelection: false,
                                      onChanged: (data) {
                                        width = double.parse(data);
                                      },
                                      keyboardType: TextInputType.number,
                                      textInputAction: TextInputAction.next,
                                      onSubmitted: (data) {
                                        FocusScope.of(context).unfocus();
                                      },
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderSide: new BorderSide(
                                              color: Colors.blue),
                                        ),
                                        labelText: 'Width',
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width - 28,
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Wept thread'),
                                  Container(
                                    width: 200,
                                    height: 35,
                                    child: TextField(
                                      controller: weptThreadC,
                                      enableInteractiveSelection: false,
                                      onChanged: (data) {
                                        weptThread = int.parse(data);
                                      },
                                      keyboardType: TextInputType.number,
                                      textInputAction: TextInputAction.next,
                                      onSubmitted: (data) {
                                        FocusScope.of(context).unfocus();
                                      },
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderSide: new BorderSide(
                                              color: Colors.blue),
                                        ),
                                        labelText: 'Wept thread',
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(3, 3, 3, 0),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(3)),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width - 28,
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Labour charge / pic'),
                                  Container(
                                    width: 200,
                                    height: 35,
                                    child: TextField(
                                      controller: labourChargeC,
                                      enableInteractiveSelection: false,
                                      onChanged: (data) {
                                        labourCharge = double.parse(data);
                                      },
                                      keyboardType: TextInputType.number,
                                      textInputAction: TextInputAction.next,
                                      onSubmitted: (data) {
                                        FocusScope.of(context).unfocus();
                                      },
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderSide: new BorderSide(
                                              color: Colors.blue),
                                        ),
                                        labelText: 'Labour charge / pic',
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width - 28,
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Other charges'),
                                  Container(
                                    width: 200,
                                    height: 35,
                                    child: TextField(
                                      controller: otherChargeC,
                                      enableInteractiveSelection: false,
                                      onChanged: (data) {
                                        otherCharge = double.parse(data);
                                      },
                                      keyboardType: TextInputType.number,
                                      textInputAction: TextInputAction.next,
                                      onSubmitted: (data) {
                                        FocusScope.of(context).unfocus();
                                      },
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderSide: new BorderSide(
                                              color: Colors.blue),
                                        ),
                                        labelText: 'Other charges',
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () async {
                await storage.ready;

                storage.setItem('warpKg', warpKg);
                storage.setItem('sizCharge', sizCharge);
                storage.setItem('thread', thread);
                storage.setItem('count', count);
                storage.setItem('tapeLength', tapeLength);
                storage.setItem('weptKg', weptKg);
                storage.setItem('bagKg', bagKg);
                storage.setItem('pic', pic);
                storage.setItem('width', width);
                storage.setItem('weptThread', weptThread);
                storage.setItem('labourCharge', labourCharge);
                storage.setItem('otherCharge', otherCharge);

                var warp =
                    ((((((warpKg + sizCharge) * 0.639) * thread) / count) *
                                tapeLength) /
                            43) /
                        1000;

                var wept =
                    (((weptKg * bagKg) * ((pic * width) / 768)) / weptThread) /
                        10;

                var tot = (warp + wept + (labourCharge * pic) + otherCharge)
                    .toStringAsFixed(2);
                print(warp);
                print(wept);
                print(tot);

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultPage(
                            tot,
                            warp.toStringAsFixed(2),
                            wept.toStringAsFixed(2),
                            labourCharge.toStringAsFixed(3),
                            otherCharge.toStringAsFixed(2))));
              },
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: Container(
                  width: 150,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(5)),
                  child: Center(
                      child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Calculate',
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ResultPage extends StatefulWidget {
  final tot, warp, wept, labour, other;
  ResultPage(this.tot, this.warp, this.wept, this.labour, this.other);

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  final _nativeAdController = NativeAdmobController();
  var adUnitId = kDebugMode
      ? "ca-app-pub-3940256099942544/2247696110"
      : "ca-app-pub-2086974693112732/2030265068";

  @override
  void dispose() {
    _nativeAdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Result'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ConstrainedBox(
            constraints: new BoxConstraints(
              maxHeight: 370,
              minWidth: MediaQuery.of(context).size.width,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.all(38.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Text('Total production cost'),
                      ),
                      Text(
                        '₹ ' + widget.tot.toString(),
                        style: TextStyle(fontSize: 45),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 350,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.black)),
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                width: 150,
                                child: Text(
                                  'Warp Cost / mtr',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                              Container(
                                width: 90,
                                child: Text(
                                  '₹ ' + widget.warp.toString(),
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                width: 150,
                                child: Text(
                                  'Wept Cost / mtr',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                              Container(
                                width: 90,
                                child: Text(
                                  '₹ ' + widget.wept.toString(),
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                width: 150,
                                child: Text(
                                  'Labour charge',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                              Container(
                                width: 90,
                                child: Text(
                                  '₹ ' + widget.labour.toString(),
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                width: 150,
                                child: Text(
                                  'Extra charge',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                              Container(
                                width: 90,
                                child: Text(
                                  '₹ ' + widget.other.toString(),
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 60,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: NativeAdmob(
                // Your ad unit id
                adUnitID: adUnitId,
                controller: _nativeAdController,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
