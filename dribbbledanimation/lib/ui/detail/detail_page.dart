import 'package:flutter/material.dart';
import 'package:dribbbledanimation/model/planets.dart';
import 'package:dribbbledanimation/ui/common/plannet_summary.dart';
import 'package:dribbbledanimation/ui/common/separator.dart';
import 'package:dribbbledanimation/ui/text_style.dart';
import 'package:dribbbledanimation/globals.dart';
import 'package:dribbbledanimation/Components/WhiteTick.dart';
import 'styles.dart';

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
            margin: EdgeInsets.only(top: 20.0),
            padding: new EdgeInsets.symmetric(horizontal: 32.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(
                  "SIGHTINGS",
                  style: Style.headerTextStyle,
                ),
                new Separator(),
                new Row(children: <Widget>[
                  new Text("23%", style: Style.increaseTextStyle),
                  new Icon(Icons.arrow_drop_up, color: Colors.green),
                ],)
                
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
