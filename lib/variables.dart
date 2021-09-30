import 'package:flutter/foundation.dart';
import 'package:localstorage/localstorage.dart';

double warpBagWeight = 50;
double warpSizingCharge = 19;
double warpCount = 41;
double warpTotalThreads = 3240;
double weptThread = 3.086;

double warpKg = 0.0;
double weptKg = 0.0;

double clothPicVar = 44;
double clothWidthVar = 53;
double loomChargeVar = 0.075;
double otherChargesVar = 0.15;

bool flag = false;

var adUnitId = kDebugMode
    ? "ca-app-pub-3940256099942544/2247696110"
    : "ca-app-pub-2086974693112732/2030265068";

final LocalStorage storage = new LocalStorage('*%^@!%%%K.dgW');
final LocalStorage ratingCountStorage = new LocalStorage('ratingCount');
