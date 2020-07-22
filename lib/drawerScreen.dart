import 'package:flutter/material.dart';
import 'settingsScreen.dart';

class DrawerScreen extends StatefulWidget {
  @override
  _DrawerState createState() => _DrawerState();
}

class _DrawerState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width - 100,
      child: Column(
        children: <Widget>[
          SizedBox(height: 100.0,),
          Text('Welcome !',style: TextStyle(fontSize: 30.0),),
          SizedBox(height: 50.0,),
          Container(
            height: MediaQuery.of(context).size.height - 300.0,
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                ListTile(
                  leading : Icon(Icons.home),
                  title: Text('Home', style: TextStyle(fontSize: 20.0),),
                  onTap: (){print('pressed');
                  Navigator.pop(context);},
                ),
                ListTile(
                  leading : Icon(Icons.flash_on),
                  title: Text('Instructions', style: TextStyle(fontSize: 20.0),),
                  onTap: (){print('pressed');},
                ),
                ListTile(
                  leading : Icon(Icons.settings),
                  title: Text('Settings', style: TextStyle(fontSize: 20.0)),
                  onTap: (){print('pressed');
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SettingsScreen()),);},
                ),
                ListTile(
                  leading : Icon(Icons.info_outline),
                  title: Text('About', style: TextStyle(fontSize: 20.0)),
                  onTap: (){print('pressed');},
                ),
                ListTile(
                  leading : Icon(Icons.thumbs_up_down),
                  title: Text('Check for Updates', style: TextStyle(fontSize: 20.0)),
                  onTap: (){print('pressed');},
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
