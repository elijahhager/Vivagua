import 'dart:async';
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

  SpeciesMatch match = new SpeciesMatch();
  List data = [species7, species6, species5, species3, species4, species2, species1];
  List selectedData = [];

  void initState() {

    
    super.initState();

    if (data.length < 7) {
      data = [species7, species6, species5, species3, species4, species2, species1];
    }

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
          if (match.decision == Decision.yes){
            selectedData.insert(0, i);
            Navigator.of(context).push(new PageRouteBuilder(
                      pageBuilder: (_, __, ___) => new MatchPage(type: i.image, spe: i),
                    ));
          }

          _buttonController.reset();

          if (data.length == 0) { Routes.navigateTo(context, 'landing');}
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
            colorFilter: new ColorFilter.mode(Colors.white.withOpacity(0.4), BlendMode.dstATop),

          ),
        ),
        alignment: Alignment.center,
        child: data.length > 0
            ? new Stack(
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
                        swipeLeft);
                  } else {
                    backCardPosition = backCardPosition - 10;
                    backCardWidth = backCardWidth + 10;

                    return cardDemoDummy(item.image, backCardPosition, 0.0, 0.0,
                        backCardWidth, 0.0, 0.0, context);
                  }
                }).toList())
            : new Text("Thank You for the Log!",
                style: new TextStyle(color: Color(0xff2298f2), fontSize: 40.0)),
      )));

  }
}
