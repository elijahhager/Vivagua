import 'package:flutter/material.dart';
import 'styles.dart';
import 'toLogDiveAnimation.dart';
import 'toLoginAnimation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/animation.dart';
import 'dart:async';
import '../../Components/AdminButton.dart';
import '../../Components/LogDiveButton.dart';
import '../../Components/SignInButton.dart';
import '../../Components/WhiteTick.dart';
import 'package:flutter/services.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key key}) : super(key: key);
  @override
  LandingScreenState createState() => new LandingScreenState();
}

class LandingScreenState extends State<LandingScreen> with TickerProviderStateMixin {

  AnimationController _logDiveButtonController;
  AnimationController _loginButtonController;

  var logDiveAnimationStatus = 0;
  var loginAnimationStatus = 0;
  @override
  void initState() {
    super.initState();
    _logDiveButtonController = new AnimationController(
        duration: new Duration(milliseconds: 3000), vsync: this);
    _loginButtonController = new AnimationController(
        duration: new Duration(milliseconds: 3000), vsync: this);
  }

  @override
  void dispose() {
    _logDiveButtonController.dispose();
    super.dispose();
    _loginButtonController.dispose();
    super.dispose();
  }

  Future<Null> _playLogDiveAnimation() async {
    try {
      await _logDiveButtonController.forward();
      await _logDiveButtonController.reverse();
    } on TickerCanceled {}
  }

  Future<Null> _playLoginAnimation() async {
    try {
      await _loginButtonController.forward();
      await _loginButtonController.reverse();
    } on TickerCanceled {}
  }

  Future<bool> _onWillPop() {
    return showDialog(
          context: context,
          child: new AlertDialog(
            title: new Text('Are you sure?'),
            actions: <Widget>[
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text('No'),
              ),
              new FlatButton(
                onPressed: () =>
                    Navigator.pushReplacementNamed(context, "/landing"),
                child: new Text('Yes'),
              ),
            ],
          ),
        ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 0.4;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return (new WillPopScope(
        onWillPop: _onWillPop,
        child: new Scaffold(
          body: new Container(
              decoration: new BoxDecoration(
                image: backgroundImage,
              ),
              child: new Container(
                  decoration: new BoxDecoration(
                      gradient: new LinearGradient(
                    colors: <Color>[
                      const Color.fromRGBO(162, 146, 199, 0.8),
                      const Color.fromRGBO(51, 51, 63, 0.9),
                    ],
                    stops: [0.2, 1.0],
                    begin: const FractionalOffset(0.0, 0.0),
                    end: const FractionalOffset(0.0, 1.0),
                  )),
                  child: new ListView(
                    padding: const EdgeInsets.all(0.0),
                    children: <Widget>[
                      new Stack(
                        alignment: AlignmentDirectional.bottomCenter,
                        children: <Widget>[
                          new Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            // children: <Widget>[
                            //   new Tick(image: tick),
                            // ],
                          ),
                          logDiveAnimationStatus == 0
                              ? new Padding(
                                  padding: const EdgeInsets.only(bottom: 0.0),
                                  child: new InkWell(
                                      onTap: () {
                                        setState(() {
                                          logDiveAnimationStatus = 1;
                                        });
                                        _playLogDiveAnimation();
                                      },
                                      child: new LogDive()),
                                )
                              : new LogDiveAnimation(
                                  buttonController:
                                      _logDiveButtonController.view),
                          loginAnimationStatus == 0
                              ? new Padding(
                                  padding: const EdgeInsets.only(bottom: 300.0),
                                  child: new InkWell(
                                      onTap: () {
                                        setState(() {
                                          loginAnimationStatus = 1;
                                        });
                                        _playLoginAnimation();
                                      },
                                      child: new SignIn()),
                                )
                              : new LoginAnimation(
                                  buttonController:
                                      _loginButtonController.view),
                        ],
                      ),
                    ],
                  ))),
        )));
  }
}
