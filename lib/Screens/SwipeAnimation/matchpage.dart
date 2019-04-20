import 'package:cloud_firestore/cloud_firestore.dart';

import 'data.dart';
import 'package:flutter/material.dart';
import 'styles.dart';
import 'package:flutter/scheduler.dart';
import 'species.dart';
import 'counter.dart';
import 'package:flutter/cupertino.dart';
import '../../Components/LogDiveButton.dart';
import '../../Screens/landing_page/index.dart';
import 'package:vivagua/globals.dart' as globals;
import 'package:vivagua/Routes.dart';
import 'package:vivagua/Components/UnrealButton.dart';

//typedef void CounterChangeCallback(num value);

class MatchPage extends StatefulWidget {
  final DecorationImage type;
  final Species spe;
  final List<Species> data;
  final Map userLog;
  //final CounterChangeCallback onChanged;
  const MatchPage({Key key, this.type, this.spe, this.data, this.userLog})
      : super(key: key);
  @override
  _MatchPageState createState() =>
      new _MatchPageState(type: type, spe: spe, data: data, userLog: userLog);
}

enum AppBarBehavior { normal, pinned, floating, snapping }

class _MatchPageState extends State<MatchPage> with TickerProviderStateMixin {
  AnimationController _containerController;
  Animation<double> width;
  Animation<double> heigth;
  DecorationImage type;
  Species spe;
  List<Species> data;
  Map userLog;

  _MatchPageState({this.type, this.spe, this.data, this.userLog});
  num _counter = 0;
  num _defaultValue = 0;
  double _appBarHeight = 350;
  int submitValue = 0;
  AppBarBehavior _appBarBehavior = AppBarBehavior.pinned;

  void initState() {
    _containerController = new AnimationController(
        duration: new Duration(milliseconds: 2000), vsync: this);
    super.initState();
    width = new Tween<double>(
      begin: 200.0,
      end: 220.0,
    ).animate(
      new CurvedAnimation(
        parent: _containerController,
        curve: Curves.ease,
      ),
    );
    heigth = new Tween<double>(
      begin: 400.0,
      end: 400.0,
    ).animate(
      new CurvedAnimation(
        parent: _containerController,
        curve: Curves.ease,
      ),
    );
    heigth.addListener(() {
      setState(() {
        if (heigth.isCompleted) {}
      });
    });
    _containerController.forward();
  }

  @override
  void dispose() {
    _containerController.dispose();
    super.dispose();
  }

  // void _incrementCounter() {
  //   //print("BEFORE");
  //   if (count + 1 <= 10) {
  //     //print("inside");
  //     //count = (count + 1);
  //   }
  // }

  // void _decrementCounter() {
  //   if (count - 1 >= 0) {
  //     //count = (count - 1);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    timeDilation = 0.7;
    int img = data.indexOf(spe); // spe used to be type
    Size screenSize = MediaQuery.of(context).size;
    return new Theme(
      data: new ThemeData(
        brightness: Brightness.light,
        primaryColor: const Color(0xff2298f2),
        platform: Theme.of(context).platform,
      ),
      child: new Container(
        width: width.value,
        height: heigth.value,
        color: new Color(0xff33ebff),
        child: new Hero(
          tag: "img",
          child: new Card(
            color: Colors.transparent,
            child: new Container(
              alignment: Alignment.center,
              width: width.value,
              height: heigth.value,
              decoration: new BoxDecoration(
                color: Colors.white,
                borderRadius: new BorderRadius.circular(10.0),
              ),
              child: new Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: <Widget>[
                  new CustomScrollView(
                    shrinkWrap: false,
                    slivers: <Widget>[
                      new SliverAppBar(
                        elevation: 0.0,
                        forceElevated: true,
                        leading: new IconButton(
                          onPressed: () {
                            if (data.length == 0) {
                              // writing entire log to database
                              userLog['timestamp'] = Timestamp.now();
                              Firestore.instance
                                  .collection('sightings')
                                  .document()
                                  .setData(Map<String, dynamic>.from(userLog));
                              Routes.navigateTo(context, 'landing',
                                  clear: true);
                            } else
                              Navigator.of(context).pop();
                          },
                          icon: new Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 45.0,
                          ),
                        ),
                        expandedHeight: screenSize.height / 2.2,
                        pinned: _appBarBehavior == AppBarBehavior.pinned,
                        floating: _appBarBehavior == AppBarBehavior.floating ||
                            _appBarBehavior == AppBarBehavior.snapping,
                        snap: _appBarBehavior == AppBarBehavior.snapping,
                        flexibleSpace: new FlexibleSpaceBar(
                          //title: new Text(spe.name),
                          background: new Stack(
                            fit: StackFit.expand,
                            children: <Widget>[
                              new Container(
                                width: width.value,
                                height: screenSize.height / 2.2,
                                decoration: new BoxDecoration(
                                  image: this.type,
                                ),
                                alignment: Alignment.bottomLeft,
                                child: new Container(
                                    padding: new EdgeInsets.only(
                                        left: 20.0, right: 30.0, top: 15.0),
                                    width: screenSize.width,
                                    height: (screenSize.height / 2.2) / 5.4,
                                    decoration: new BoxDecoration(
                                      gradient: new LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          Colors.transparent,
                                          Colors.black.withOpacity(0.75),
                                        ],
                                      ),
                                    ),
                                    child: new Text(
                                      spe.name,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 56.0,
                                      ),
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ),
                      new SliverList(
                        delegate: new SliverChildListDelegate(<Widget>[
                          new Container(
                            color: Colors.white,
                            child: new Padding(
                              padding: const EdgeInsets.all(35.0),
                              child: new Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  new Container(
                                    padding: new EdgeInsets.only(bottom: 40.0),
                                    alignment: Alignment.center,
                                    decoration: new BoxDecoration(
                                        color: Colors.white,
                                        border: new Border(
                                            bottom: new BorderSide(
                                                color: Colors.black12))),
                                    child: new Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        new Text(
                                          "How many did you see?",
                                          style: TextStyle(
                                              fontSize: 22,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                  ),
                                  new Container(
                                      padding: new EdgeInsets.only(top: 26.0),
                                      alignment: Alignment.center,
                                      child: new Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          new Container(
                                            alignment: Alignment.center,
                                            child: Counter(
                                              initialValue: _defaultValue,
                                              minValue: 0,
                                              maxValue: 10,
                                              step: 1,
                                              decimalPlaces: 0,
                                              onChanged: (value) {
                                                submitValue = value;
                                                print(value);
                                                setState(() {
                                                  _defaultValue = value;
                                                  _counter = value;
                                                });
                                              },
                                            ),
                                          ),
                                        ],
                                      )),
                                  new Center(
                                      child: new UnrealButton(
                                          height: 72.0,
                                          width: 180.0,
                                          highlightColor: Colors.blue[50],
                                          shadowColor: Colors.blue[200],
                                          backgroundColor: Colors.white,
                                          content: new Icon(Icons.done,
                                              color: Colors.blue, size: 40),
                                          borderRadius: 20.0,
                                          onPressed: () {
                                            userLog[this.spe.name] =
                                                submitValue;

                                            if (data.length == 0) {
                                              // writing entire log to database
                                              userLog['timestamp'] =
                                                  Timestamp.now();
                                              Firestore.instance
                                                  .collection('sightings')
                                                  .document()
                                                  .setData(
                                                      Map<String, dynamic>.from(
                                                          userLog));

                                              Routes.navigateTo(
                                                  context, 'landing',
                                                  clear: true);
                                            } else
                                              Navigator.of(context).pop();
                                          }))
                                ],
                              ),
                            ),
                          ),
                        ]),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
