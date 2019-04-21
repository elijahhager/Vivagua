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
    bottom: bottom - 10,
    // right: flag == 0 ? right != 0.0 ? right : null : null,
    //left: flag == 1 ? right != 0.0 ? right : null : null,
    child: new Card(
      color: Colors.transparent,
      elevation: 8.0,
      child: new Container(
        alignment: Alignment.center,
        width: screenSize.width / 1.3 + cardWidth - 20,
        height: screenSize.height / 1.9 - 20,
        decoration: new BoxDecoration(
          color: Color.fromRGBO(250, 250, 250, 1),
          borderRadius: new BorderRadius.circular(12.0),
        ),
        child: new Column(
          children: <Widget>[
            new Container(
              width: screenSize.width / 1.3 + cardWidth - 20,
              height: screenSize.height / 1.9 - 20,
              decoration: new BoxDecoration(
                borderRadius: new BorderRadius.circular(12.0),
                image: img,
              ),
              alignment: Alignment.bottomLeft,
              padding: new EdgeInsets.only(left: 16.0, bottom: 8.0),
            ),
            // new Container(
            //   width: screenSize.width / 1.2 + cardWidth,
            //   height: screenSize.height / 1.7 - screenSize.height / 2.2,
            //   alignment: Alignment.center,
            //   child: new Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //     children: <Widget>[
            //       //new Text("Name Here"),
            //       // new FlatButton(
            //       //     padding: new EdgeInsets.all(0.0),
            //       //     onPressed: () {},
            //       //     child: new Container(
            //       //       height: 72.0,
            //       //       width: 146.0,
            //       //       alignment: Alignment.center,
            //       //       decoration: new BoxDecoration(
            //       //         color: Colors
            //       //             .grey[100], //Color.fromRGBO(255, 10, 10, 0.9),
            //       //         borderRadius: new BorderRadius.circular(20.0),
            //       //         boxShadow: [
            //       //           new BoxShadow(
            //       //             color: Colors.red,
            //       //             blurRadius: 2,
            //       //             offset: new Offset(0, 2.0),
            //       //           )
            //       //         ],
            //       //       ),
            //       //       child:
            //       //           new Icon(Icons.clear, color: Colors.red, size: 61),
            //       //     )),
            //       // new FlatButton(
            //       //     padding: new EdgeInsets.all(0.0),
            //       //     onPressed: () {},
            //       //     child: new Container(
            //       //       height: 72.0,
            //       //       width: 146.0,
            //       //       alignment: Alignment.center,
            //       //       decoration: new BoxDecoration(
            //       //         color: Colors
            //       //             .grey[100], //Color.fromRGBO(10, 235, 10, 0.85),
            //       //         borderRadius: new BorderRadius.circular(20.0),
            //       //         boxShadow: [
            //       //           new BoxShadow(
            //       //             color: Colors.green,
            //       //             blurRadius: 2,
            //       //             offset: new Offset(0, 2.0),
            //       //           )
            //       //         ],
            //       //       ),
            //       //       child: new Icon(Icons.check,
            //       //           color: Colors.green, size: 61),
            //       //     ))
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    ),
  );
}
