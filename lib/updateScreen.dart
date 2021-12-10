import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:in_app_review/in_app_review.dart';

class UpdateApp extends StatefulWidget {
  @override
  _UpdateAppState createState() => _UpdateAppState();
}

class _UpdateAppState extends State<UpdateApp> {
  final InAppReview inAppReview = InAppReview.instance;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: 300,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          border: Border.all(color: Colors.grey)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "New Version available",
                style: TextStyle(fontSize: 23),
              ),
              Text(
                "Please update the app to continue",
                style: TextStyle(fontSize: 12),
              ),
              Image.asset(
                'images/playStore.png',
                width: 180,
              )
            ],
          ),
          GestureDetector(
            onTap: () async {
              inAppReview.openStoreListing(
                  appStoreId: '...', microsoftStoreId: '...');
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3), color: Colors.green),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Update now",
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
