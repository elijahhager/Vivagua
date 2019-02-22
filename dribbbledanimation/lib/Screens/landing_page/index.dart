import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'styles.dart';
import 'package:flutter/foundation.dart';
import 'dart:async';
import '../../Components/LogDiveButton.dart';
import '../../Components/WhiteTick.dart';
import '../choose_dive_site/index.dart';

import 'package:flutter/services.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import '../../globals.dart' as globals;

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key key}) : super(key: key);
  @override
  LandingScreenState createState() => new LandingScreenState();
}

class LandingScreenState extends State<LandingScreen> {
  Future<bool> _onWillPop() {
    return showDialog(
          context: context,
          child: new AlertDialog(
            title: new Text('Go back to the start?'),
            actions: <Widget>[
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text('No thanks'),
              ),
              new FlatButton(
                onPressed: () =>
                    Navigator.of(context).pop(true),
                child: new Text('Yep'),
              ),
            ],
          ),
        ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    debugPrint(globals.selected_dive_site);
    timeDilation = 0.4;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return (new WillPopScope(
        onWillPop: _onWillPop,
        child: new Scaffold(
          body: new Container(
            child: new Center(
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new Tick(image: logo, width: 250.0, height: 250.0), 
                  new KOutlineButton(
                    radius: 30.0,
                    borderColor: Colors.blue,
                    text: 'Start',
                    textColor: Colors.blue,
                    textFontWeight: FontWeight.bold,
                    onPressed: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(builder: (context) => ChooseDiveSiteScreen()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        )));
  }
}
