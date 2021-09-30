import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:in_app_review/in_app_review.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

final Uri paramsUrl = Uri(
  scheme: 'mailto',
  path: 'sumeshbharathi@gmail.com',
);

class AboutPage extends StatefulWidget {
  final isDarkMode;

  AboutPage(this.isDarkMode);

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  final InAppReview inAppReview = InAppReview.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: widget.isDarkMode ? Colors.black : Colors.white,
        child: Center(
          child: Container(
            height: MediaQuery.of(context).size.height - 100,
            width: MediaQuery.of(context).size.width - 50,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Designed & developed by',
                        style: GoogleFonts.quicksand(
                            fontSize: 16.0,
                            color: widget.isDarkMode
                                ? Colors.white
                                : Colors.black54,
                            wordSpacing: 2.0),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(800.0)),
                        child: Container(
                          color: Colors.black,
                          child: Padding(
                            padding: const EdgeInsets.all(0.05),
                            child: Container(
                              color: Colors.grey,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(400.0)),
                                  child: Image.asset(
                                    'images/aboutDev.png',
                                    width: 100.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'Sumesh Bharathi Ramasamy',
                        style: TextStyle(
                          fontSize: 21.0,
                          color:
                              widget.isDarkMode ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          IconRow(
                            urlLink:
                                'https://www.linkedin.com/in/sumeshbharathi/',
                            iconName: LineAwesomeIcons.linkedin,
                            isDarkMode: widget.isDarkMode,
                          ),
                          IconRow(
                            urlLink:
                                'https://www.instagram.com/sumesh_bharathi/',
                            iconName: LineAwesomeIcons.instagram,
                            isDarkMode: widget.isDarkMode,
                          ),
                          IconRow(
                            urlLink: 'https://github.com/SumeshBharathi',
                            iconName: LineAwesomeIcons.github_square,
                            isDarkMode: widget.isDarkMode,
                          ),
                          IconRow(
                            urlLink: 'https://sumeshbharathi.com',
                            iconName: LineAwesomeIcons.globe,
                            isDarkMode: widget.isDarkMode,
                          ),
                          IconRow(
                            urlLink: paramsUrl.toString(),
                            iconName: LineAwesomeIcons.envelope_open,
                            isDarkMode: widget.isDarkMode,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () async {
                          inAppReview.openStoreListing(
                              appStoreId: '...', microsoftStoreId: '...');
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Card(
                            color: widget.isDarkMode
                                ? Colors.white54
                                : Colors.green,
                            child: Container(
                                height: 50,
                                width: 260,
                                alignment: Alignment.center,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    SizedBox(
                                      width: 5.0,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Text(
                                        'Give a rating',
                                        style: GoogleFonts.questrial(
                                            fontSize: 18, color: Colors.white),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 6.0,
                                    ),
                                    Icon(
                                      Icons.star_outlined,
                                      size: 24,
                                      color: Colors.white,
                                    )
                                  ],
                                )),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          setState(() {
                            print(widget.isDarkMode);
                            Share.share(
                                'Check this app on Play Store:\n\nTextile Calculator - PowerLoom\n' +
                                    'https://play.google.com/store/apps/details?id=sumeshbharathi.textile_calculator');
                          });
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          child: Card(
                            color: widget.isDarkMode
                                ? Colors.white54
                                : Colors.black45,
                            child: Container(
                                height: 50,
                                width: 260,
                                alignment: Alignment.center,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    SizedBox(
                                      width: 5.0,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Text(
                                        'Share',
                                        style: GoogleFonts.questrial(
                                            fontSize: 18, color: Colors.white),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 6.0,
                                    ),
                                    ClipRRect(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20.0)),
                                        child: Icon(
                                          Icons.share,
                                          size: 24,
                                          color: Colors.white,
                                        ))
                                  ],
                                )),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 8, 0, 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Made with ',
                        style: GoogleFonts.quicksand(
                            fontSize: 16.0,
                            color: widget.isDarkMode
                                ? Colors.white
                                : Colors.black54,
                            wordSpacing: 2.0),
                      ),
                      Icon(
                        Icons.favorite,
                        size: 13,
                        color:
                            widget.isDarkMode ? Colors.white : Colors.black54,
                      ),
                      Text(
                        ' in India',
                        style: GoogleFonts.quicksand(
                            fontSize: 16.0,
                            color: widget.isDarkMode
                                ? Colors.white
                                : Colors.black54,
                            wordSpacing: 2.0),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Icon Row
class IconRow extends StatefulWidget {
  final urlLink, iconName, isDarkMode;
  IconRow({this.urlLink, this.iconName, this.isDarkMode});

  @override
  _IconRowState createState() => _IconRowState();
}

class _IconRowState extends State<IconRow> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await launch(widget.urlLink);
      },
      child: Icon(
        widget.iconName,
        size: 34.0,
        color: widget.isDarkMode ? Colors.white : Colors.black,
      ),
    );
  }
}
