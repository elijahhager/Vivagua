import 'package:flutter/material.dart';
import 'package:dribbbledanimation/model/planets.dart';
import 'package:dribbbledanimation/ui/common/plannet_summary.dart';
import 'package:dribbbledanimation/ui/common/separator.dart';
import 'package:dribbbledanimation/ui/text_style.dart';
import 'package:dribbbledanimation/globals.dart';
import 'package:dribbbledanimation/Components/WhiteTick.dart';
import 'styles.dart';
import 'package:dribbbledanimation/Components/SimpleTimeSeriesChart.dart';

class DetailPage extends StatelessWidget {
  final Planet planet;

  DetailPage(this.planet);

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
        'assets/hawksbill_turtle.jpg',
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
        padding: new EdgeInsets.fromLTRB(0.0, 72.0, 0.0, 32.0),
        children: <Widget>[
          // header block
          new PlanetSummary(
            planet,
            horizontal: false,
          ),
          // summary block
          new Container(
            padding: new EdgeInsets.symmetric(horizontal: 32.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(
                  "SUMMARY",
                  style: Style.headerTextStyle,
                ),
                new Separator(),
                new Text(planet.description, style: Style.commonTextStyle),
              ],
            ),
          ),
          // statistics block
          new Container(
            margin: EdgeInsets.only(top: 25.0),
            padding: new EdgeInsets.symmetric(horizontal: 32.0),
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
                              Text("23%", style: Style.increaseTextStyle),
                              Icon(Icons.arrow_drop_up, color: Colors.green, size: 40.0),
                            ],
                          ),
                          Text("increase since last week", style: Style.commonTextStyle, textAlign: TextAlign.center),
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
                              Text("23%", style: Style.increaseTextStyle),
                              Icon(Icons.arrow_drop_up, color: Colors.green, size: 40.0),
                            ],
                          ),
                          Text("increase since last week", style: Style.commonTextStyle, textAlign: TextAlign.center),
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
                              Text("23%", style: Style.increaseTextStyle),
                              Icon(Icons.arrow_drop_up, color: Colors.green, size: 40.0),
                            ],
                          ),
                          Text("increase since last week", style: Style.commonTextStyle, textAlign: TextAlign.center),
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
                              Text("23%", style: Style.increaseTextStyle),
                              Icon(Icons.arrow_drop_up, color: Colors.green, size: 40.0),
                            ],
                          ),
                          Text("increase since last week", style: Style.commonTextStyle, textAlign: TextAlign.center),
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
            margin: EdgeInsets.only(top: 25.0),
            padding: new EdgeInsets.symmetric(horizontal: 32.0),
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
