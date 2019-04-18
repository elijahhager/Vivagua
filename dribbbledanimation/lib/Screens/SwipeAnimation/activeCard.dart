import 'dart:math';

import 'detail.dart';
import 'package:flutter/material.dart';
import 'species.dart';
import 'matchpage.dart';

Positioned cardDemo(
    Species sp,
    DecorationImage img,
    double bottom,
    double right,
    double left,
    double cardWidth,
    double rotation,
    double skew,
    BuildContext context,
    Function dismissImg,
    int flag,
    Function addImg,
    Function swipeRight,
    Function swipeLeft,
    List<Species> data) {
  Size screenSize = MediaQuery.of(context).size;
  // print("Card");
  return new Positioned(
    bottom: 120.0,// + bottom,
    right: flag == 0 ? right != 0.0 ? right : null : null,
    left: flag == 1 ? right != 0.0 ? right : null : null,
    child: new Dismissible(
      key: new Key(new Random().toString()),
      crossAxisEndOffset: -0.3,
      onResize: () {
        //print("here");
        // setState(() {
        //   var i = data.removeLast();

        //   data.insert(0, i);
        // });
      },
      onDismissed: (DismissDirection direction) {
//          _swipeAnimation();
        if (direction == DismissDirection.endToStart) {
          dismissImg(sp);
        } else {
          Navigator.of(context).push(new PageRouteBuilder(
            pageBuilder: (_, __, ___) => new MatchPage(type: img, spe: sp),
          ));
          addImg(sp);
        }
      },
      child: new Transform(
        alignment: flag == 0 ? Alignment.bottomRight : Alignment.bottomLeft,
        //transform: null,
        transform: new Matrix4.skewX(skew),
        //..rotateX(-math.pi / rotation),
        child: new RotationTransition(
          turns: new AlwaysStoppedAnimation(
              flag == 0 ? rotation / 360 : -rotation / 360),
          child: new Hero(
            tag: "img",
            child: new GestureDetector(
              onTap: () {
                Navigator.of(context).push(new PageRouteBuilder(
                  pageBuilder: (_, __, ___) =>
                      new DetailPage(type: img, spe: sp, data: data),
                ));
              },
              child: new Card(
                color: Colors.transparent,
                elevation: 8.0,
                child: new Container(
                  alignment: Alignment.center,
                  width: screenSize.width / 1.14 + cardWidth - 10,
                  height: screenSize.height / 1.5 - 40,
                  decoration: new BoxDecoration(
                    color: Color.fromRGBO(250, 250, 250, 1),
                    borderRadius: new BorderRadius.circular(12.0),
                  ),
                  child: new Column(
                    children: <Widget>[
                      new Container(
                        width: screenSize.width / 1.14 + cardWidth - 10,
                        height: screenSize.height / 1.9 - 40,
                        decoration: new BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: new BorderRadius.only(
                              topLeft: new Radius.circular(12.0),
                              topRight: new Radius.circular(12.0)),
                          image: img,
                          // border: Border.all(
                          //         color: Color(0xff2298f2),
                          //         width: 5.0,
                          //  ),
                        ),
                      ),
                      new Container(
                          width: screenSize.width / 1.2 + cardWidth,
                          height:
                              screenSize.height / 1.7 - screenSize.height / 2.2,
                          alignment: Alignment.center,
                          child: new Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              //new Text("Name Here"),
                              new FlatButton(
                                  padding: new EdgeInsets.all(0.0),
                                  onPressed: () {
                                    swipeLeft();
                                  },
                                  child: new Container(
                                    height: 82.0,
                                    width: 165.0,
                                    alignment: Alignment.center,
                                    decoration: new BoxDecoration(
                                      color: Colors.grey[100],//Color.fromRGBO(255, 10, 10, 0.9),
                                      borderRadius:
                                          new BorderRadius.circular(20.0),
                                      boxShadow: [new BoxShadow(color: Colors.red, blurRadius: 2, offset: new Offset(0, 2.0),)],
                                    ),
                                    child: new Icon(Icons.clear, color: Colors.red, size: 61),
                                    // new Text(
                                    //   "NO",
                                    //   style: new TextStyle(
                                    //       color: Colors.white,
                                    //       fontSize: 26,
                                    //       fontWeight: FontWeight.w400),
                                    // ),
                                  )),
                              new FlatButton(
                                  padding: new EdgeInsets.all(0.0),
                                  onPressed: () {
                                    swipeRight();
                                  },
                                  child: new Container(
                                    height: 82.0,
                                    width: 165.0,
                                    alignment: Alignment.center,
                                    decoration: new BoxDecoration(
                                      color: Colors.grey[100],//Color.fromRGBO(10, 235, 10, 0.85),
                                      borderRadius: new BorderRadius.circular(20.0),
                                      boxShadow: [new BoxShadow(color: Colors.green, blurRadius: 2, offset: new Offset(0, 2.0),)],
                                    ),
                                    child: new Icon(Icons.check, color: Colors.green, size: 61),
                                    // new Text(
                                    //   "YES",
                                    //   style: new TextStyle(
                                    //       color: Colors.green,
                                    //       fontSize: 26,
                                    //       fontWeight: FontWeight.w600),
                                    // ),
                                  ))
                            ],
                          ))
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
