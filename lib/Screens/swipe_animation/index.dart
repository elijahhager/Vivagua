import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'dummy_card.dart';
import 'active_card.dart';
import 'package:vivagua/components/WhiteTick.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'matches.dart';
import 'species.dart';
import 'match_page.dart';
import 'styles.dart';
import 'package:vivagua/components/UnrealButton.dart';
import 'package:vivagua/routes.dart';
import 'package:vivagua/globals.dart' as globals;

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

  Map userLog = {"divesite": globals.selectedDivesite};

  SpeciesMatch match = new SpeciesMatch();
  List<Species> data = [];

  List selectedData = [];

  List<Widget> screenWidgets = [];

  static _buildSpecs(QuerySnapshot querySnapshot) {
    List<Species> specs = [];

    for (var doc in querySnapshot.documents) {
      var namesImg = doc['other_images'];
      List<String> otherImages = namesImg.split("#");
      List<AssetImage> temp = [];
      for (var img in otherImages) {
        temp.add(
          new AssetImage(img),
        );
      }
      Species newSpec = Species(
          DecorationImage(
            image: new ExactAssetImage(doc['card_image']),
            fit: BoxFit.fill,
          ),
          temp,
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
            print("ran this");
            Navigator.of(context).push(new PageRouteBuilder(
              pageBuilder: (_, __, ___) => new MatchPage(
                  type: i.image, spe: i, data: data, userLog: userLog),
            ));
          }

          _buttonController.reset();

          if (data.length == 0 && match.decision != Decision.yes) {
            // writing entire log to database
            userLog['timestamp'] = Timestamp.now();
            Firestore.instance
                .collection('sightings')
                .document()
                .setData(Map<String, dynamic>.from(userLog));
            Routes.navigateTo(context, 'success', clear: true);
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

  Widget _buildBottomBar() {
    Size screenSize = MediaQuery.of(context).size;
    return BottomAppBar(
      color: Colors.transparent,
      elevation: 0.0,
      child: new Padding(
        padding: const EdgeInsets.all(16.0),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            new UnrealButton(
                height: screenSize.height * 0.095,
                width: screenSize.width * 0.45,
                highlightColor: Colors.red[50],
                shadowColor: Colors.red,
                backgroundColor: Colors.grey[100],
                content: new Icon(Icons.clear,
                    color: Colors.red, size: screenSize.width * 0.11),
                borderRadius: 20.0,
                onPressed: () {
                  swipeLeft();
                }),
            new UnrealButton(
                height: screenSize.height * 0.095,
                width: screenSize.width * 0.45,
                highlightColor: Colors.green[50],
                shadowColor: Colors.green,
                backgroundColor: Colors.grey[100],
                content: new Icon(Icons.check,
                    color: Colors.green, size: screenSize.width * 0.11),
                borderRadius: 20.0,
                onPressed: () {
                  swipeRight();
                }),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    timeDilation = 0.4;

    double backCardPosition = 10;
    double backCardWidth = -10.0;

    print(data.length);

    return (new Scaffold(
      appBar: AppBar(
          elevation: 0.9,
          title: Tick(image: lil_whale, height: 40, width: 45),
          centerTitle: true,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(
            color: Colors.blue, //change your color here
          )),
      bottomNavigationBar: _buildBottomBar(),
      body: new Container(
        alignment: Alignment.center,
        child: StreamBuilder(
            stream: Firestore.instance.collection("species").snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return Text("Loading...");

              if (data.length == 0 && !completed) {
                data = _buildSpecs(snapshot.data);

                // initialize all to 0
                for (var d in data) userLog[d.name.replaceAll(new RegExp(r' '), '_').toLowerCase()] = 0;
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
                        data,
                        userLog);
                  } else {
                    backCardPosition = backCardPosition + 10;
                    backCardWidth = backCardWidth + 10;
                    print(
                        "This is the postion: " + backCardPosition.toString());

                    return cardDemoDummy(item.image, backCardPosition, 0.0, 0.0,
                        backCardWidth + 5, 0.0, 0.0, context);
                  }
                }).toList(),
              );
            }),
      ),
    ));
  }
}
