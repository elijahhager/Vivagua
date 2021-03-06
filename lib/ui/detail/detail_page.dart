import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vivagua/model/specs.dart';
import 'package:vivagua/ui/common/spec_summary.dart';
import 'package:vivagua/ui/common/separator.dart';
import 'package:vivagua/styles.dart';
import 'package:vivagua/components/SimpleTimeSeriesChart.dart';

class DetailPage extends StatelessWidget {
  final DocumentSnapshot spec;

  DetailPage(this.spec);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      
      body: new Container(
        constraints: new BoxConstraints.expand(),
        color: new Color(0xFFFFFFFF),
        child: new Stack(
          children: <Widget>[
            _getBackground(),
            _getGradient(),
            _getContent(),
            _getToolbar(context),
          ],
        ),
      ),
    );
  }

  Container _getBackground() {
    return new Container(
      child: new Image.asset(
        'assets/water_brim.jpg',
        fit: BoxFit.cover,
        height: 300.0,
      ),
      constraints: new BoxConstraints.expand(height: 295.0),
    );
  }

  Container _getGradient() {
    return new Container(
      margin: new EdgeInsets.only(top: 190.0),
      height: 110.0,
      decoration: new BoxDecoration(
        gradient: new LinearGradient(
          colors: <Color>[new Color(0x00736AB7), new Color(0xFFFFFFFF)],
          stops: [0.0, 0.9],
          begin: const FractionalOffset(0.0, 0.0),
          end: const FractionalOffset(0.0, 1.0),
        ),
      ),
    );
  }

  Container _getContent() {
    return new Container(
      child: new ListView(
        children: <Widget>[
          // header block
          new SpecSummary(
            spec,
            horizontal: false,
          ),
          // summary block
          new Container(
            decoration: new BoxDecoration(
              gradient: new LinearGradient(
                colors: <Color>[
                  new Color.fromRGBO(255, 255, 255, 0),
                  new Color(0xFFFFFFFF)
                ],
                stops: [0, 0.1],
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(0.0, 1.0),
              ),
            ),
            padding: new EdgeInsets.only(
                top: 35.0, left: 25.0, right: 25.0, bottom: 25.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(
                  "SUMMARY",
                  style: Style.headerTextStyle,
                ),
                new Separator(),
                new Text(spec['description'],
                    style: Style.commonTextStyle, textAlign: TextAlign.justify),
              ],
            ),
          ),
          // statistics block
          new Container(
            decoration: new BoxDecoration(
              color: Colors.white,
            ),
            padding: new EdgeInsets.all(25.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(
                  "INSIGHTS",
                  style: Style.headerTextStyle,
                ),
                new Separator(),
                new Row(
                  children: <Widget>[
                    // a floating block
                    new Container(
                      margin: EdgeInsets.all(10.0),
                      padding: new EdgeInsets.all(8.0),
                      decoration: new BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          new BoxShadow(
                            color: Colors.black12,
                            offset: new Offset(0.0, 0.0),
                            spreadRadius: 1.0,
                            blurRadius: 10.0,
                          )
                        ],
                      ),
                      width: 150,
                      height: 90,
                      child: new Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              StreamBuilder<DocumentSnapshot>(
                                stream: Firestore.instance
                                    .collection("statistics")
                                    .document(this.spec.documentID)
                                    .snapshots(),
                                builder: (context, snapshot) {
                                  if (!snapshot.hasData)
                                    return const Text('...');
                                  var percentage = snapshot
                                          .data["seenThisWeek"] /
                                      (snapshot.data["seenLastWeek"] + 0.00001);
                                  return new Text(
                                      ((percentage * 100).round()).toString() +
                                          "%",
                                      style: Style.increaseTextStyle);
                                },
                              ),
                              Icon(Icons.arrow_drop_up,
                                  color: Colors.green, size: 40.0),
                            ],
                          ),
                          Text("increase this week",
                              style: Style.commonTextStyle,
                              textAlign: TextAlign.center),
                        ],
                      ),
                    ),
                    // a floating block
                    new Container(
                      margin: EdgeInsets.all(10.0),
                      padding: new EdgeInsets.all(8.0),
                      decoration: new BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          new BoxShadow(
                            color: Colors.black12,
                            offset: new Offset(0.0, 0.0),
                            spreadRadius: 1.0,
                            blurRadius: 10.0,
                          )
                        ],
                      ),
                      width: 150,
                      height: 90,
                      child: new Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              StreamBuilder<DocumentSnapshot>(
                                stream: Firestore.instance
                                    .collection("statistics")
                                    .document(this.spec.documentID)
                                    .snapshots(),
                                builder: (context, snapshot) {
                                  if (!snapshot.hasData)
                                    return const Text('...');
                                  var percentage = snapshot
                                          .data["diversWhoSaw"] /
                                      (snapshot.data["diversWhoSaw"] +
                                          snapshot.data["diversWhoDidNotSee"] +
                                          0.00001);
                                  return new Text(
                                      ((percentage * 100).round()).toString() +
                                          "%",
                                      style: Style.increaseTextStyle);
                                },
                              ),
                              Icon(Icons.bookmark,
                                  color: Colors.green, size: 30.0),
                            ],
                          ),
                          Text("of divers saw this",
                              style: Style.commonTextStyle,
                              textAlign: TextAlign.center),
                        ],
                      ),
                    )
                  ],
                ),
                new Row(
                  children: <Widget>[
                    // a floating block
                    new Container(
                      margin: EdgeInsets.all(10.0),
                      padding: new EdgeInsets.all(8.0),
                      decoration: new BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          new BoxShadow(
                            color: Colors.black12,
                            offset: new Offset(0.0, 0.0),
                            spreadRadius: 1.0,
                            blurRadius: 10.0,
                          )
                        ],
                      ),
                      width: 150,
                      height: 90,
                      child: new Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              StreamBuilder<DocumentSnapshot>(
                                stream: Firestore.instance
                                    .collection("statistics")
                                    .document(this.spec.documentID)
                                    .snapshots(),
                                builder: (context, snapshot) {
                                  if (!snapshot.hasData)
                                    return const Text('...');
                                  var numberSeen =
                                      snapshot.data["seenThisWeek"];
                                  return new Text(numberSeen.toString(),
                                      style: Style.increaseTextStyle);
                                },
                              ),
                            ],
                          ),
                          Text("seen this week",
                              style: Style.commonTextStyle,
                              textAlign: TextAlign.center),
                        ],
                      ),
                    ),
                    // a floating block
                    new Container(
                      margin: EdgeInsets.all(10.0),
                      padding: new EdgeInsets.all(8.0),
                      decoration: new BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          new BoxShadow(
                            color: Colors.black12,
                            offset: new Offset(0.0, 0.0),
                            spreadRadius: 1.0,
                            blurRadius: 10.0,
                          )
                        ],
                      ),
                      width: 150,
                      height: 90,
                      child: new Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              StreamBuilder<DocumentSnapshot>(
                                stream: Firestore.instance
                                    .collection("statistics")
                                    .document(this.spec.documentID)
                                    .snapshots(),
                                builder: (context, snapshot) {
                                  if (!snapshot.hasData)
                                    return const Text('...');
                                  var diversThisMonth =
                                      snapshot.data["diversWhoSaw"] +
                                          snapshot.data["diversWhoDidNotSee"];
                                  return new Text(diversThisMonth.toString(),
                                      style: Style.increaseTextStyle);
                                },
                              ),
                              Icon(Icons.arrow_drop_up,
                                  color: Colors.green, size: 40.0),
                            ],
                          ),
                          Text("divers this month",
                              style: Style.commonTextStyle,
                              textAlign: TextAlign.center),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          // trends block
          new Container(
            decoration: new BoxDecoration(
              color: Colors.white,
            ),
            padding:
                new EdgeInsets.only(top: 25, left: 25, right: 25, bottom: 60),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(
                  "TRENDS",
                  style: Style.headerTextStyle,
                ),
                new Separator(),
                new Container(
                  height: 200,
                  child: new SimpleTimeSeriesChart.withSampleData(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container _getToolbar(BuildContext context) {
    return new Container(
      margin: new EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: new BackButton(color: Colors.white),
    );
  }
}
