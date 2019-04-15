import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'dart:async';
import '../../Components/LogDiveButton.dart';
import '../../Components/WhiteTick.dart';
import 'package:dribbbledanimation/Routes.dart';
import '../choose_dive_site/index.dart';

import 'package:flutter/services.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import '../../globals.dart' as globals;
import 'package:dribbbledanimation/styles.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key key}) : super(key: key);
  @override
  LandingScreenState createState() => new LandingScreenState();
}

class LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {

    timeDilation = 0.4;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return new Scaffold(
      body: new Container(
        child: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Tick(image: logo, width: 250.0, height: 250.0),
              new KOutlineButton(
                minWidth: 150.0,
                radius: 30.0,
                borderColor: Colors.blue,
                text: 'Log a Dive',
                textColor: Colors.blue,
                textFontWeight: FontWeight.bold,
                onPressed: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (context) => ChooseDiveSiteScreen()),
                  );
                },
              ),
              new Container(
                height: 10.0,
              ),
              new KOutlineButton(
                minWidth: 100.0,
                radius: 30.0,
                borderColor: Colors.blue,
                text: 'Admin',
                textColor: Colors.blue,
                textFontWeight: FontWeight.bold,
                onPressed: () {
                  Routes.navigateTo(context, 'admin_home');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
