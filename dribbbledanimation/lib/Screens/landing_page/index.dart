import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'dart:async';
import '../../Components/LogDiveButton.dart';
import '../../Components/WhiteTick.dart';
import 'package:dribbbledanimation/Routes.dart';
import '../choose_dive_site/index.dart';
import 'package:dribbbledanimation/Components/UnrealButton.dart';

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
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff2298f2),
        tooltip: "ADMIN",
        onPressed: () {
          Routes.navigateTo(context, 'admin_home');
        },
        child: Icon(Icons.book),
      ),
      body: new Container(
        child: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Tick(image: logo, width: 250.0, height: 250.0),
              new UnrealButton(
                  height: 62.0,
                  width: 125.0,
                  highlightColor: Colors.blue[50],
                  shadowColor: Colors.blue,
                  backgroundColor: Colors.white,
                  content: new Icon(Icons.arrow_forward, color: Colors.blue, size: 41),
                  borderRadius: 20.0,
                  onPressed: () {
                    Routes.navigateTo(context, "choose_dive_site");
                  }),
              new Container(
                height: 10.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
