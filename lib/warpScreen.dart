import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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


  void refresh(){
    setState(() {
      var res =  storage.getItem('secretkey');
      print('got');
      clothPicVar = clothPicVar;
      clothWidthVar = res[0]['clothWidthVar'];
      loomChargeVar = res[0]['loomChargeVar'];
      otherChargesVar =  res[0]['otherChargesVar'];
      warpSizingCharge = res[0]['warpSizingCharge'];
      warpCount =  warpCount;
      print(warpCount);
    });
  }


@override
  void initState() {
  super.initState();

  }

  @override
  Widget build(BuildContext context) {
    ((){
      var res =  storage.getItem('secretkey');
      print('yes');
      print(res);
      if(res!= null && res[0]['status'] == 'true' && !flag){
        flag = true;
        setState(() {
          clothPicVar = res[0]['clothPic'];
          clothWidthVar = res[0]['clothWidthVar'];
          loomChargeVar = res[0]['loomChargeVar'];
          otherChargesVar =  res[0]['otherChargesVar'];
          warpSizingCharge = res[0]['warpSizingCharge'];
          warpCount =  res[0]['warpCount'];
          print(warpCount);
        });
      }
    })();


    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  flag ? Text('Warp', style: TextStyle(fontSize: 30.0),) : Text('warp', style: TextStyle(fontSize: 30.0),),
                  SizedBox(height: 20.0,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                          width: 150.0,
                          child: Text('Price (per Kg)', style: TextStyle(fontSize: 20.0),)
                      ),
                      Container(
                        width: 170.0,
                        height: 50.0,
                        child: TextField(
                          controller: priceOfWarpBag,
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: new BorderSide(color: Colors.blue),
                            ),
                            labelText: 'Rate',
                          ),
                          onChanged: (data){
                            warpKg = double.parse(data);
                          },
                          onSubmitted: (data){
                            FocusScope.of(context).nextFocus();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                  itemWidget('Weight', warpBagWeight.toString() + ' Kg'),
                  itemWidget('Sizing charge', '₹ '+warpSizingCharge.toString()),
                  itemWidget('Warp total threads', warpTotalThreads.toString()),
                  itemWidget('Warp Count', warpCount.toString())

                ],
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Text('Wept', style: TextStyle(fontSize: 30.0),),
                  SizedBox(height: 20.0,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Container(
                            width: 150.0,
                            child: Text('Price (per Kg)', style: TextStyle(fontSize: 20.0),)
                        ),
                        Container(
                          width: 170.0,
                          height: 50.0,
                          child: TextField(
                            onChanged: (data){
                              weptKg= double.parse(data);
                            },
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            onSubmitted: (data){
                              FocusScope.of(context).nextFocus();
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: new BorderSide(color: Colors.blue),
                              ),
                              labelText: 'Rate',
                            ),

                          ),
                        ),
                      ],
                    ),
                  ),
                  itemWidget('Thread \n(Pic x Width)', ((clothPicVar * clothWidthVar) / 768).toStringAsFixed(2)),
                  SizedBox(height: 50.0,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 200.0,
                      decoration: BoxDecoration(
                        color: Colors.blue[400],
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: FlatButton(
                        child: Text(
                          'Calculate', style: TextStyle(color: Colors.white,fontSize: 20.0),
                        ),

                        onPressed: (){
                          double totalWarp = ((((((((warpKg ) + warpSizingCharge) * 0.639) * warpTotalThreads) / warpCount) * 45)  / 43)/1000);
                          double totalWept = (((weptKg * 50) * ((clothPicVar * clothWidthVar) / 768)) / 330) / 10 ;
                          //RoundOff - Warp
                          String roundOfWarp = totalWarp.toStringAsFixed(2);
                          totalWarp = double.parse(roundOfWarp);
                          //RoundOff - Warp
                          String roundOfWept = totalWept.toStringAsFixed(2);
                          totalWept = double.parse(roundOfWept);

                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Net Total value', style: TextStyle(fontSize: 28.0,color: Colors.blue),textAlign: TextAlign.center,),
                              content: Container(
                                height: 250.0,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text('Warp Cost:   ₹ ' + totalWarp.toString() + '\nWept Cost:   ₹ ' + totalWept.toString()+ '\nLoom cost:   ₹ ' + (clothPicVar * loomChargeVar).toString()
                                    + '\nOther costs: ₹ '+ otherChargesVar.toString(), style: TextStyle(fontSize: 16.0),),
                                    SizedBox(height: 50.0,),
                                    Text('₹ ' + (totalWept+totalWarp+(clothPicVar * loomChargeVar)+otherChargesVar).toStringAsFixed(2), style: TextStyle(fontSize: 40.0),)
                                  ],
                                ),
                              ),
                              actions: <Widget>[
                                FlatButton(

                                  child: Text('Close', style: TextStyle(fontSize: 20.0,color: Colors.red),),
                                  onPressed: (){
                                    Navigator.of(context).pop();
                                  },
                                )
                              ],
                            );
                          },);
                        },
                      ),
                    ),
                  )

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

WarpScreen obj;
