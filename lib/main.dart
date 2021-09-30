import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:textile_calculator/HomeScreen.dart';
import 'package:textile_calculator/exitRate.dart';
import 'package:textile_calculator/settingsScreen.dart';
import 'package:textile_calculator/updatePlayStore.dart';
import 'variables.dart';
import 'about.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

bool rateFlag;

var version = 1.6, reqVersion = 0.0;

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

    getAppUpdates();
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
                  Text('Textile Calculator (Loom)'),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Scaffold(
                                        body: SettingsScreen(
                                            refreshParentState))));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.settings),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Scaffold(
                                        appBar: AppBar(
                                          title: Text('About'),
                                        ),
                                        body: AboutPage(false))));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.info_outline),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            body: WarpScreen(),
          ),
          onWillPop: () async {
            // if (rateFlag == true) {
            //   print("Exit requested");
            //   SystemChannels.platform.invokeMethod('SystemNavigator.pop');
            // } else {
            print(rateFlag);
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return RateUs();
                });
            // }

            return true;
          },
        ),
        reqVersion > version ? UpdateApp() : Container(),
      ]),
    );
  }
}
