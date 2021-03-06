import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'styles.dart';
import 'package:flutter/scheduler.dart';
import 'species.dart';
import 'counter.dart';
import 'package:flutter/cupertino.dart';
import 'package:vivagua/components/LogDiveButton.dart';
import 'package:vivagua/screens/landing_page/index.dart';
import 'package:vivagua/globals.dart' as globals;
import 'package:vivagua/routes.dart';
import 'package:vivagua/components/UnrealButton.dart';
import 'package:vivagua/components/SickSlider.dart';

class OtherMatchPage extends StatefulWidget {
  final DecorationImage type;
  final Species spe;
  final List<Species> data;
  final Map userLog;
  //final CounterChangeCallback onChanged;
  const OtherMatchPage({Key key, this.type, this.spe, this.data, this.userLog})
      : super(key: key);
  @override
  _OtherMatchPageState createState() => new _OtherMatchPageState(
      type: type, spe: spe, data: data, userLog: userLog);
}

enum AppBarBehavior { normal, pinned, floating, snapping }

class _OtherMatchPageState extends State<OtherMatchPage>
    with TickerProviderStateMixin {
  AnimationController _containerController;
  Animation<double> width;
  Animation<double> heigth;
  DecorationImage type;
  Species spe;
  List<Species> data;
  Map userLog;

  _OtherMatchPageState({this.type, this.spe, this.data, this.userLog});
  num _counter = 0;
  num _defaultValue = 0;
  double _appBarHeight = 350;
  int submitValue = 0;
  double val = 1;
  AppBarBehavior _appBarBehavior = AppBarBehavior.pinned;

  TextEditingController controller = new TextEditingController();
  String input;

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

    controller.addListener(() {
      setState(() {
        input = controller.text;
      });
    });
  }

  @override
  void dispose() {
    _containerController.dispose();
    controller.dispose();
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

  _buildChildren() {
    Size screenSize = MediaQuery.of(context).size;
    List<Widget> children = <Widget>[
      new Container(
        padding: new EdgeInsets.only(bottom: 40.0),
        alignment: Alignment.center,
        decoration: new BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text(
                  "What species did you see?",
                  style: TextStyle(
                      fontSize: screenSize.width * 0.055,
                      color: Colors.black,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
            new TextField(
              //autofocus: true,
              decoration: new InputDecoration(
                  hintText: "Species Name",
                  contentPadding: const EdgeInsets.only(
                      right: 40.0, left: 40.0, top: 10.0, bottom: 10.0)),
              textAlign: TextAlign.center,
              controller: controller,
            ),
          ],
        ),
      ),
      new Container(
        padding: new EdgeInsets.only(bottom: 40.0),
        alignment: Alignment.center,
        decoration: new BoxDecoration(
            color: Colors.white,
            border: new Border(bottom: new BorderSide(color: Colors.black12))),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              "How many did you see?",
              style: TextStyle(
                  fontSize: screenSize.width * 0.055,
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
            mainAxisAlignment: MainAxisAlignment.center,
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
              height: screenSize.height * 0.1,
              width: screenSize.width * 0.4,
              highlightColor: Colors.blue[50],
              shadowColor: Colors.blue[200],
              backgroundColor: Colors.white,
              content: new Icon(Icons.done,
                  color: Colors.blue, size: screenSize.width * 0.1),
              borderRadius: 20.0,
              onPressed: () {
                userLog["other"] = {
                  "species_name": globals.databasify(controller.text),
                  "number_seen": submitValue,
                  "size": 10 // this should fetch the size from the slider
                };

                if (this.data.length == 0) {
                  // writing entire log to database
                  userLog['timestamp'] = Timestamp.now();
                  Firestore.instance
                      .collection('sightings')
                      .document()
                      .setData(Map<String, dynamic>.from(userLog));

                  Routes.navigateTo(context, 'success', clear: true);
                } else
                  Navigator.of(context).pop();
              }))
    ];
    if (_counter > 0) {
      for (int i = 0; i < _counter; i++) {
        children.insert(
            children.length - 1,
            SickSlider(
              height: screenSize.height * 0.10,
              width: screenSize.height * 0.90,
              max: 3,
              min: 1,
              val: 2,
              divisions: 2,
              activeColor: Colors.blue,
              inactiveColor: Colors.grey,
            ));
      }
    }
    return children;
  }

  void changed(e) {
    setState(() {
      val = e;
    });
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 0.7;
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
                            if (this.data.length == 0) {
                              // writing entire log to database
                              userLog['timestamp'] = Timestamp.now();
                              Firestore.instance
                                  .collection('sightings')
                                  .document()
                                  .setData(Map<String, dynamic>.from(userLog));
                              Routes.navigateTo(context, 'success',
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
                                        fontSize: screenSize.width * 0.07,
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
                                children: _buildChildren(),
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
