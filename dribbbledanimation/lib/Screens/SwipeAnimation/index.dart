import 'dart:async';
import 'data.dart';
import 'dummyCard.dart';
import 'activeCard.dart';

//import 'package:animation_exp/PageReveal/page_main.dart';
import '../../Components/WhiteTick.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'matches.dart';
import 'species.dart';
import 'matchpage.dart';
import 'styles.dart';
import '../success_page/index.dart';

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
  List data = imageData;
  List selectedData = [];

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
          if (match.decision == Decision.yes){
            selectedData.insert(0, i);
            Navigator.of(context).push(new PageRouteBuilder(
                      pageBuilder: (_, __, ___) => new MatchPage(type: i.image, spe: i),
                    ));
          }

          _buttonController.reset();

          if (data.length == 0) {
            
            // send firebase request
            // clear user input values
            // reset the species card
            
            Navigator.of(context).pushReplacement(new PageRouteBuilder(
              maintainState: true,
              opaque: true,
              pageBuilder: (context, _, __) => new SuccessScreen(),
              transitionDuration: const Duration(milliseconds: 1000),
              transitionsBuilder: (context, anim1, anim2, child) {
                return new FadeTransition(
                  child: child,
                  opacity: anim1,
                );
              }));
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
    var dataLength = data.length;
    if(dataLength <= 0){Navigator.popUntil(context, ModalRoute.withName('landing'));}
    double backCardPosition = initialBottom + (dataLength - 1) * 10 + 10;
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
        color: new Color(0xffffffff),
        alignment: Alignment.center,
        child: dataLength > 0
            ? new Stack(
                alignment: AlignmentDirectional.center,
                children: data.map((item) {
                  if (data.indexOf(item) == dataLength - 1) {
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
