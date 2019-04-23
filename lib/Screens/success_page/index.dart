import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:vivagua/routes.dart';
import 'dart:async';
import 'package:vivagua/components/WhiteTick.dart';
import 'package:vivagua/styles.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({Key key}) : super(key: key);
  @override
  SuccessScreenState createState() => new SuccessScreenState();
}

class SuccessScreenState extends State<SuccessScreen> {

  @override
  initState() {
    super.initState();
    new Timer(const Duration(seconds: 1), onClose);
  }

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
          body: new Container(
            child: new Center(
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new Tick(image: logo_success, width: 250.0, height: 250.0), 
                ],
              ),
            ),
          ),
        );
  }

  void onClose() {
    Routes.navigateTo(context, "landing", clear: true);
  }

}
