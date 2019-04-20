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
    List<Species> data,
    Map userLog) {
  Size screenSize = MediaQuery.of(context).size;

  return new Positioned(
    
    // bottom: 120.0,   // autocenters if we don't specify this
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
            pageBuilder: (_, __, ___) => new MatchPage(type: img, spe: sp, data: data, userLog: userLog),
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
                        //padding: new EdgeInsets.only(left: 24.0),
                        child: new Container(
                          alignment: Alignment.centerLeft,
                          padding: new EdgeInsets.only(
                              left: 20.0, right: 30.0, top: 15.0),
                          width: (screenSize.width / 1.14 + cardWidth),
                          height: (screenSize.height / 1.5 - 40) / 5.4,
                          decoration: new BoxDecoration(
                            borderRadius: new BorderRadius.circular(12.0),
                            gradient: new LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Colors.black.withOpacity(0.75),
                              ],
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              new Text(
                                sp.name,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Overpass SemiBold',
                                  //fontWeight: FontWeight.bold,
                                  fontSize: screenSize.width * 0.08,
                                ),
                              ),
                              new Icon(
                                Icons.info,
                                color: Colors.white,
                                size: 38,
                              ),
                            ],
                          ),
                        ),
                      ),
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
