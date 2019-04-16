import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'dummyCard.dart';
import 'activeCard.dart';
import '../../Components/WhiteTick.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'matches.dart';
import 'species.dart';
import 'matchpage.dart';
import 'styles.dart';
import 'package:dribbbledanimation/Routes.dart';
import 'package:dribbbledanimation/globals.dart' as globals;

class CardDemo extends StatefulWidget {
  @override
  CardDemoState createState() => new CardDemoState();
}

class CardDemoState extends State<CardDemo> with TickerProviderStateMixin {
  AnimationController _buttonController;
  Animation<double> rotate;
  Animation<double> right;
  Animation<double> bottom;
  Animation<double> width;
  int flag = 0;
  bool completed = false;

  var userLog = {"divesite": globals.selectedDivesite};

  SpeciesMatch match = new SpeciesMatch();
  List<Species> data = [];

  List selectedData = [];

  static _buildSpecs(QuerySnapshot querySnapshot) {
    List<Species> specs = [];

    for (var doc in querySnapshot.documents) {
      Species newSpec = Species(
          DecorationImage(
            image: new ExactAssetImage(doc['card_image']),
            fit: BoxFit.fill,
          ),
          doc['name'],
          doc['description'],
          doc['status'],
          Color(0xff24ba1f));

      specs.add(newSpec);
    }

    return specs;
  }

  void initState() {
    super.initState();

    match = new SpeciesMatch();

    _buttonController = new AnimationController(
        duration: new Duration(milliseconds: 500), vsync: this);

    rotate = new Tween<double>(
      begin: -0.0,
      end: -40.0,
    ).animate(
      new CurvedAnimation(
        parent: _buttonController,
        curve: Curves.ease,
      ),
    );

    rotate.addListener(() {
      setState(() {
        if (rotate.isCompleted) {
          var i = data.removeLast();
          //data.insert(0, i);
          //print();
          if (match.decision == Decision.yes) {
            selectedData.insert(0, i);
            Navigator.of(context).push(new PageRouteBuilder(
              pageBuilder: (_, __, ___) => new MatchPage(
                  type: i.image, spe: i, data: data, userLog: userLog),
            ));
          }

          _buttonController.reset();

          if (data.length == 0 && match.decision != Decision.yes) {
            // writing entire log to database
            userLog['timestamp'] = Timestamp.now().toString();
            Firestore.instance
                .collection('sightings')
                .document()
                .setData(userLog);
            Routes.navigateTo(context, 'landing', clear: true);
          }
        }
      });
    });

    right = new Tween<double>(
      begin: 0.0,
      end: 400.0,
    ).animate(
      new CurvedAnimation(
        parent: _buttonController,
        curve: Curves.ease,
      ),
    );
    bottom = new Tween<double>(
      begin: 15.0,
      end: 100.0,
    ).animate(
      new CurvedAnimation(
        parent: _buttonController,
        curve: Curves.ease,
      ),
    );
    width = new Tween<double>(
      begin: 20.0,
      end: 25.0,
    ).animate(
      new CurvedAnimation(
        parent: _buttonController,
        curve: Curves.bounceOut,
      ),
    );
  }

  @override
  void dispose() {
    _buttonController.dispose();
    super.dispose();
  }

  Future<Null> _swipeAnimation() async {
    try {
      await _buttonController.forward();
    } on TickerCanceled {}
  }

  dismissImg(Species s) {
    setState(() {
      data.remove(s);
    });
  }

  addImg(Species s) {
    setState(() {
      data.remove(s);
      selectedData.add(s);
    });
  }

  swipeRight() {
    if (flag == 0)
      setState(() {
        flag = 1;
      });
    match.yes();
    _swipeAnimation();
  }

  swipeLeft() {
    if (flag == 1)
      setState(() {
        flag = 0;
      });
    match.nope();
    _swipeAnimation();
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 0.4;

    double initialBottom = 15.0;
    double backCardPosition = initialBottom + (data.length - 1) * 10 + 10;
    double backCardWidth = -10.0;

    print(data.length);

    return (new Scaffold(
      appBar: AppBar(
          title: Tick(image: which, width: 250.0, height: 30.0),
          centerTitle: true,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(
            color: Colors.blue, //change your color here
          )),
      body: new Container(
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new AssetImage("assets/underwater.jpg"),
            fit: BoxFit.cover,
            colorFilter: new ColorFilter.mode(
                Colors.white.withOpacity(0.4), BlendMode.dstATop),
          ),
        ),
        alignment: Alignment.center,
        child: StreamBuilder(
            stream: Firestore.instance.collection("species").snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return Text("Loading...");

              if (data.length == 0 && !completed) {
                data = _buildSpecs(snapshot.data);

                // initialize all to 0
                for (var d in data) userLog[d.name] = (0).toString();
              }

              completed = true;
              return new Stack(
                  alignment: AlignmentDirectional.center,
                  children: data.map((item) {
                    if (data.indexOf(item) == data.length - 1) {
                      return cardDemo(
                          item,
                          item.image,
                          bottom.value,
                          right.value,
                          0.0,
                          backCardWidth + 10,
                          rotate.value,
                          rotate.value < -10 ? 0.1 : 0.0,
                          context,
                          dismissImg,
                          flag,
                          addImg,
                          swipeRight,
                          swipeLeft,
                          data);
                    } else {
                      backCardPosition = backCardPosition - 10;
                      backCardWidth = backCardWidth + 10;

                      return cardDemoDummy(item.image, backCardPosition, 0.0,
                          0.0, backCardWidth, 0.0, 0.0, context);
                    }
                  }).toList());
            }),
      ),
    ));
  }
}
