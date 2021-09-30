import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:textile_calculator/variables.dart';

saveRatingValue(bool flag) async {
  await ratingCountStorage.ready;
  ratingCountStorage.setItem('ratingCount', flag);
  print('Saved to storage! ' + flag.toString());
}

class RateUs extends StatefulWidget {
  @override
  _RateUsState createState() => _RateUsState();
}

class _RateUsState extends State<RateUs> {
  final InAppReview inAppReview = InAppReview.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var ratingCount = storage.getItem('ratingCount');
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        "Enjoying the app?",
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Please take a moment to rate the app (5 Stars ⭐) on Google Play Store.",
            textAlign: TextAlign.start,
          ),
        ],
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Cancel',
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                )),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                },
                child: Text(
                  'Exit',
                  style: TextStyle(color: Colors.red, fontSize: 17),
                )),
            TextButton(
                onPressed: () {
                  // saveRatingValue(true);
                  // SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                  inAppReview.openStoreListing(
                      appStoreId: '...', microsoftStoreId: '...');
                },
                child: Text('Rate', style: TextStyle(fontSize: 17)))
          ],
        ),
      ],
    );
  }
}
