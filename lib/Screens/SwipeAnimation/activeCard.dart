import 'dart:math';

import 'detail.dart';
import 'package:flutter/material.dart';
import 'species.dart';
import 'matchpage.dart';
import 'package:dribbbledanimation/Components/UnrealButton.dart';

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

  return new Positioned(
    bottom: 120.0,
    right: flag == 0 ? right != 0.0 ? right : null : null,
    left: flag == 1 ? right != 0.0 ? right : null : null,
    child: new Dismissible(
      key: new Key(new Random().toString()),
      crossAxisEndOffset: -0.3,
      onDismissed: (DismissDirection direction) {
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
        transform: new Matrix4.skewX(skew),
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
                  width: screenSize.width / 1.14 + cardWidth,
                  height: screenSize.height / 1.5 - 40,
                  decoration: new BoxDecoration(
                    color: Color.fromRGBO(250, 250, 250, 1),
                    borderRadius: new BorderRadius.circular(12.0),
                  ),
                  child: new Column(
                    children: <Widget>[
                      new Container(
                        width: screenSize.width / 1.14 + cardWidth,
                        height: screenSize.height / 1.5 - 40,
                        decoration: new BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: new BorderRadius.circular(12.0),
                          image: img,
                        ),
                        alignment: Alignment.bottomLeft,
                        padding: new EdgeInsets.only(left: 24.0),
                        child: new Container(
                          alignment: Alignment.centerLeft,
                          padding: new EdgeInsets.only(left: 16.0),
                          width: (screenSize.width / 1.14 + cardWidth),
                          height: (screenSize.height / 1.5 - 40) / 7,
                          // decoration: new BoxDecoration(
                          //   color: Color.fromRGBO(0, 0, 0, 0.44),
                          //   borderRadius: new BorderRadius.only(
                          //       bottomLeft: Radius.circular(30.0),
                          //       bottomRight: Radius.circular(30.0)),
                          // ),
                          child: new Text(
                            sp.name,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 56.0,
                                shadows: [
                                  Shadow(
                                      // bottomLeft
                                      offset: Offset(-1.5, -1.5),
                                      color: Colors.grey[800]),
                                  Shadow(
                                      // bottomRight
                                      offset: Offset(1.5, -1.5),
                                      color: Colors.grey[800]),
                                  Shadow(
                                      // topRight
                                      offset: Offset(1.5, 1.5),
                                      color: Colors.grey[800]),
                                  Shadow(
                                      // topLeft
                                      offset: Offset(-1.5, 1.5),
                                      color: Colors.grey[800]),
                                ]),
                          ),
                          
                        ),
                      ),
                      // new Container(
                      //     width: screenSize.width / 1.2 + cardWidth,
                      //     height:
                      //         screenSize.height / 1.7 - screenSize.height / 2.2,
                      //     alignment: Alignment.center,
                      //     child: new Row(
                      //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //       children: <Widget>[
                      //         // new UnrealButton(
                      //         //     height: 82.0,
                      //         //     width: 165.0,
                      //         //     highlightColor: Colors.red[50],
                      //         //     shadowColor: Colors.red,
                      //         //     backgroundColor: Colors.grey[100],
                      //         //     content: new Icon(Icons.clear,
                      //         //         color: Colors.red, size: 61),
                      //         //     borderRadius: 20.0,
                      //         //     onPressed: () {
                      //         //       swipeLeft();
                      //         //     }),
                      //         // new UnrealButton(
                      //         //     height: 82.0,
                      //         //     width: 165.0,
                      //         //     highlightColor: Colors.green[50],
                      //         //     shadowColor: Colors.green,
                      //         //     backgroundColor: Colors.grey[100],
                      //         //     content: new Icon(Icons.check,
                      //         //         color: Colors.green, size: 61),
                      //         //     borderRadius: 20.0,
                      //         //     onPressed: () {
                      //         //       swipeRight();
                      //         //     }),
                      //       ],
                      //     ))
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
