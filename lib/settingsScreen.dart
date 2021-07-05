import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'variables.dart';
import 'dart:io';
import 'warpScreen.dart';


class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

TextEditingController clothPic, clothWidth,loomCharge, sizingCharge,otherCharges,warpCountController,warpTotThreadsController;

class _SettingsScreenState extends State<SettingsScreen> {
  List list;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    clothPic = new TextEditingController(text: clothPicVar.toString());
    clothWidth = new TextEditingController(text: clothWidthVar.toString());
    loomCharge = new TextEditingController(text: loomChargeVar.toString());
    sizingCharge = new TextEditingController(text: warpSizingCharge.toString());
    otherCharges = new TextEditingController(text: otherChargesVar.toString());
    warpCountController = new TextEditingController(text: warpCount.toString());
    warpTotThreadsController = new TextEditingController(text: warpTotalThreads.toString());
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      width: 200.0,
                        child: Text('Cloth Pic ', style: TextStyle(fontSize: 17.0),)
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      width: 100.0,
                      height: 40.0,
                      child: TextField(
                        controller:  clothPic,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: new BorderSide(color: Colors.blue),
                          ),
                          labelText: 'Pic',
                        ),
                        onChanged: (data){
                        },
                        onSubmitted: (data){
                          FocusScope.of(context).nextFocus();
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                        width: 200.0,
                        child: Text('Cloth width (inch) ', style: TextStyle(fontSize: 17.0),)
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      width: 100.0,
                      height: 40.0,
                      child: TextField(
                        controller: clothWidth,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: new BorderSide(color: Colors.blue),
                          ),
                          labelText: 'Inch',
                        ),
                        onChanged: (data){
                        },
                        onSubmitted: (data){
                          FocusScope.of(context).nextFocus();
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                        width: 200.0,
                        child: Text('Loom Charge  ₹', style: TextStyle(fontSize: 17.0),)
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      width: 100.0,
                      height: 40.0,
                      child: TextField(
                        controller: loomCharge,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: new BorderSide(color: Colors.blue),
                          ),
                          labelText: '₹',
                        ),
                        onChanged: (data){
                        },
                        onSubmitted: (data){
                          FocusScope.of(context).nextFocus();
                        },
                      ),
                    ),
                  ),

                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                        width: 200.0,
                        child: Text('Warp Count ', style: TextStyle(fontSize: 17.0),)
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      width: 100.0,
                      height: 40.0,
                      child: TextField(
                        controller: warpCountController,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: new BorderSide(color: Colors.blue),
                          ),
                          labelText: 'Count',
                        ),
                        onChanged: (data){
                        },
                        onSubmitted: (data){
                          FocusScope.of(context).nextFocus();
                        },
                      ),
                    ),
                  ),

                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                        width: 200.0,
                        child: Text('Warp (Total threads)', style: TextStyle(fontSize: 17.0),)
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      width: 100.0,
                      height: 40.0,
                      child: TextField(
                        controller: warpTotThreadsController,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: new BorderSide(color: Colors.blue),
                          ),
                          labelText: 'Count',
                        ),
                        onChanged: (data){
                        },
                        onSubmitted: (data){
                          FocusScope.of(context).nextFocus();
                        },
                      ),
                    ),
                  ),

                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                        width: 200.0,
                        child: Text('Sizing Charge  ₹', style: TextStyle(fontSize: 17.0),)
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      width: 100.0,
                      height: 40.0,
                      child: TextField(
                        controller: sizingCharge,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: new BorderSide(color: Colors.blue),
                          ),
                          labelText: '₹',
                        ),
                        onChanged: (data){
                        },
                        onSubmitted: (data){
                          FocusScope.of(context).nextFocus();
                        },
                      ),
                    ),
                  ),

                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                        width: 200.0,
                        child: Text('Other Charges  ₹', style: TextStyle(fontSize: 17.0),)
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      width: 100.0,
                      height: 40.0,
                      child: TextField(
                        controller: otherCharges,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: new BorderSide(color: Colors.blue),
                          ),
                          labelText: '₹',
                        ),
                        onChanged: (data){
                        },
                        onSubmitted: (data){
                          FocusScope.of(context).nextFocus();
                        },
                      ),
                    ),
                  ),

                ],
              ),
            ),
            SizedBox(height: 30.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GestureDetector(
                  onTap: (){
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Reset / Restore the data to default ?', style: TextStyle(fontSize: 25.0,),textAlign: TextAlign.start,),

                          actions: <Widget>[
                            FlatButton(

                              child: Text('Reset', style: TextStyle(fontSize: 20.0, color: Colors.red),),
                              onPressed: (){
                                setState(() {
                                  warpBagWeight = 50;
                                  warpSizingCharge = 19;
                                  warpCount = 41;
                                  warpTotalThreads = 3240;
                                  weptThread = 3.086;

                                  clothPicVar = 44;
                                  clothWidthVar = 53;
                                  loomChargeVar = 0.075;
                                  otherChargesVar = 0.15;
                                  storage.clear();
                                });

                                Navigator.of(context).pop();
                              },
                            ),
                            FlatButton(

                              child: Text('Cancel', style: TextStyle(fontSize: 20.0, color: Colors.green),),
                              onPressed: (){
                                Navigator.of(context).pop();
                              },
                            ),

                          ],
                        );
                      },);

                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.red[400],
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    child:
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text('Reset', style: TextStyle(color: Colors.white,fontSize: 20.0)),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    setState(() {

                      print('press');
                      clothPicVar = double.parse(clothPic.text);
                      clothWidthVar = double.parse(clothWidth.text);
                      loomChargeVar = double.parse(loomCharge.text);
                      otherChargesVar = double.parse(otherCharges.text);
                      warpSizingCharge = double.parse(sizingCharge.text);
                      warpCount = double.parse(warpCountController.text);
                      warpTotalThreads = double.parse(warpTotThreadsController.text);
                      if(list != null){
                        list.clear();
                      }

                      list = [{'status': 'true','clothPic':clothPicVar,'clothWidthVar' : clothWidthVar,
                      'loomChargeVar' : loomChargeVar,'otherChargesVar': otherChargesVar,
                        'warpSizingCharge' : warpSizingCharge,'warpCount': warpCount,'warpTotalThreads':warpTotalThreads}];
                      storage.setItem('secretkey', list);
                      print('Saved to storage! ' + list.toString());

                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Saved successfully !', style: TextStyle(fontSize: 30.0,),textAlign: TextAlign.center,),

                            actions: <Widget>[
                              FlatButton(

                                child: Text('Close', style: TextStyle(fontSize: 20.0),),
                                onPressed: (){


                                  Navigator.of(context).pop();
                                  Navigator.of(context).pop();

                                },
                              )
                            ],
                          );
                        },);

                    });

                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue[400],
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    child:
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(' Save Changes ', style: TextStyle(color: Colors.white,fontSize: 20.0)),
                    ),
                  ),
                ),

              ],
            ),



          ],
        ),
      ),
    );
  }
}
