import 'package:flutter/material.dart';

Positioned cardDemoDummy(
    DecorationImage img,
    double bottom,
    double right,
    double left,
    double cardWidth,
    double rotation,
    double skew,
    BuildContext context) {
  Size screenSize = MediaQuery.of(context).size;
  // Size screenSize=(500.0,200.0);
  // print("dummyCard");
  return new Positioned(
    bottom: 100.0 + bottom,
    // right: flag == 0 ? right != 0.0 ? right : null : null,
    //left: flag == 1 ? right != 0.0 ? right : null : null,
    child: new Card(
      color: Colors.transparent,
      elevation: 8.0,
      child: new Container(
        alignment: Alignment.center,
        width: screenSize.width / 1.2 + cardWidth - 70,
        height: screenSize.height / 1.7 - 70,
        decoration: new BoxDecoration(
          color: Color.fromRGBO(250, 250, 250, 1),
          borderRadius: new BorderRadius.circular(12.0),
        ),
        child: new Column(
          children: <Widget>[
            new Container(
              width: screenSize.width / 1.2 + cardWidth - 70,
              height: screenSize.height / 2.2 - 70,
              decoration: new BoxDecoration(
                borderRadius: new BorderRadius.only(
                    topLeft: new Radius.circular(12.0),
                    topRight: new Radius.circular(12.0)),
                image: img,
              ),
            ),
            new Container(
                width: screenSize.width / 1.2 + cardWidth,
                height: screenSize.height / 1.7 - screenSize.height / 2.2,
                alignment: Alignment.center,
            ),
          ],
        ),
      ),
    ),
  );
}
