import 'package:flutter/material.dart';
import 'package:textile_calculator/warpScreen.dart';
import 'drawerScreen.dart';
import 'variables.dart';
import 'package:flutter/services.dart';


void main() {

  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print(storage.getItem('secretkey'));
    return MaterialApp(
      title: 'Textile Calculator',
      theme: ThemeData(

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Textile Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.black.withOpacity(0), //top bar color
        statusBarIconBrightness: Brightness.dark, //top bar icons
        systemNavigationBarColor: Colors.black, //bottom bar color
        systemNavigationBarIconBrightness: Brightness.light, //bottom bar icons
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        brightness: Brightness.light,
      ),

      drawer: DrawerScreen(),
      body: WarpScreen(),
    );
  }
}


