import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:vivagua/routes.dart';
import 'dart:async';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:vivagua/components/WhiteTick.dart';
import 'package:vivagua/styles.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({Key key}) : super(key: key);
  @override
  SuccessScreenState createState() => new SuccessScreenState();
}

class SuccessScreenState extends State<SuccessScreen> {
  double rating = 0;
  @override
  initState() {
    super.initState();
    new Timer(const Duration(seconds: 10), onClose);
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return new Scaffold(
      body: new Container(
        child: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Material(
                elevation: 4.0,
                shape: CircleBorder(),
                color: Colors.white,
                child: Ink.image(
                  image: AssetImage('assets/success.png'),
                  fit: BoxFit.cover,
                  width: screenSize.width * 0.35,
                  height: screenSize.height * 0.35,
                  child: InkWell(
                    onTap: () {},
                    child: null,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 25, bottom: 30),
              ),

              SmoothStarRating(
                allowHalfRating: false,
                onRatingChanged: (v) {
                  rating = v;
                  setState(() {});
                },
                starCount: 5,
                rating: rating,
                size: 70.0,
                color: Colors.blue,
                borderColor: Colors.blue,
              ),
              //new Tick(image: logo_success, width: 220.0, height: 220.0),
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
