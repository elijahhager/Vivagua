import 'data.dart';
import 'package:flutter/material.dart';
import 'styles.dart';
import 'package:flutter/scheduler.dart';
import 'species.dart';
import 'counter.dart';
import 'package:flutter/cupertino.dart';
import '../../Components/LogDiveButton.dart';
import '../../Screens/landing_page/index.dart';
 

//typedef void CounterChangeCallback(num value);

class MatchPage extends StatefulWidget {
  final DecorationImage type;
  final Species spe;
  //final CounterChangeCallback onChanged;
  const MatchPage({Key key, this.type, this.spe,}) : super(key: key);
  @override
  _MatchPageState createState() => new _MatchPageState(type: type, spe: spe,);
}

enum AppBarBehavior { normal, pinned, floating, snapping }

class _MatchPageState extends State<MatchPage> with TickerProviderStateMixin {
  AnimationController _containerController;
  Animation<double> width;
  Animation<double> heigth;
  DecorationImage type;
  Species spe;
  // CounterChangeCallback onChanged = (value) {
  //               setState(() {
  //                 _defaultValue = value;
  //                 _counter = value;
  //               });
  _MatchPageState({this.type, this.spe});
  List data = permData;
  num _counter = 0;
  num _defaultValue = 0;
  double _appBarHeight = 350;
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
                            Navigator.of(context).pop();
                          },
                          icon: new Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 45.0,
                          ),
                        ),
                        expandedHeight: _appBarHeight,
                        pinned: _appBarBehavior == AppBarBehavior.pinned,
                        floating: _appBarBehavior == AppBarBehavior.floating ||
                            _appBarBehavior == AppBarBehavior.snapping,
                        snap: _appBarBehavior == AppBarBehavior.snapping,
                        flexibleSpace: new FlexibleSpaceBar(
                          title: new Text(spe.name),
                          background: new Stack(
                            fit: StackFit.expand,
                            children: <Widget>[
                              new Container(
                                width: width.value,
                                height: _appBarHeight,
                                decoration: new BoxDecoration(
                                  image: data[img].image,
                                ),
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
                                             new Text("How many did you see?", style: TextStyle(fontSize: 22, color: Colors.black),),

                                      ],
                                    ),
                                  ),
                                  new Container(
                                   // padding: new EdgeInsets.only(bottom: 20.0),
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
                                                        setState(() {
                                                          _defaultValue = value;
                                                          _counter = value;
                                                        });
                                                      },
                                                  ),     
                                            ),
                                      ],
                                    )
                                  ),
                                  new Center(
                                    child: new KOutlineButton(
                                      minWidth: 150.0,
                                      radius: 50.0,
                                      borderColor: Colors.blue,
                                      text: 'Submit',
                                      textColor: Colors.blue,
                                      textFontWeight: FontWeight.bold,
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      }
                                    ),
                                  )
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
