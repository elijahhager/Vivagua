import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vivagua/ui/common/separator.dart';
import 'package:vivagua/ui/detail/detail_page.dart';
import 'package:vivagua/styles.dart';
import 'package:vivagua/globals.dart';

class SpecSummary extends StatelessWidget {

  final DocumentSnapshot spec;
  final bool horizontal;

  SpecSummary(this.spec, {this.horizontal = true});

  SpecSummary.vertical(this.spec): horizontal = false;

  @override
  Widget build(BuildContext context) {

    Size screenSize = MediaQuery.of(context).size;

    final specThumbnail = new Container(
      margin: new EdgeInsets.symmetric(
        vertical: 16.0
      ),
      alignment: horizontal ? FractionalOffset.centerLeft : FractionalOffset.center,
      
      child: new Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(50.0)),
          boxShadow: [BoxShadow(
            color: Colors.black26,
            blurRadius: 3.0,
            spreadRadius: 3.0
          )]
        ),
        child: new Hero(
        
          tag: "spec-hero-${spec['id']}",
          child: new Image(
            
            image: new AssetImage(spec['image']),      
            height: screenSize.width * 0.23,
            width: screenSize.width * 0.23,
          ),
        ),
    ));



    Widget _specValue({String value, Icon icon}) {
      return new Container(
        child: new Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            icon,
            new Container(width: screenSize.width * 0.05),
            new Text(value, style: Style.smallTextStyle),
          ]
        ),
      );
    }


    final specCardContent = new Container(
      margin: new EdgeInsets.fromLTRB(horizontal ? screenSize.width * 0.19 : screenSize.width * 0.1, horizontal ? screenSize.width * 0.025 : screenSize.height * 0.055, screenSize.width * 0.1, screenSize.width * 0.035),
      constraints: new BoxConstraints.expand(),
      child: new Column(
        crossAxisAlignment: horizontal ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: <Widget>[
          new Container(height: screenSize.height * 0.023),
          new Text(spec['name'], style: Style.titleTextStyle),
          new Container(height: screenSize.height * 0.0001),
          new Text(spec['location'], style: Style.commonTextStyle),
          new Separator(),
          new Row(
            
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Expanded(
                flex: horizontal ? 1 : 0,
                child: _specValue(
                  value: spec['status'],
                  icon: Icon(Icons.alarm, size: screenSize.width * 0.035, color: Colors.blue))

              ),
              new Container(
                width: horizontal ? screenSize.width * 0.017 : screenSize.width * 0.09,
              ),
              new Expanded(
                  flex: horizontal ? 1 : 0,
                  child: _specValue(
                  value: spec['nativity'],
                  icon: Icon(Icons.location_on, size: screenSize.width * 0.035, color: Colors.blue))
              )
            ],
          ),
        ],
      ),
    );


    final specCard = new Container(
      child: specCardContent,
      height: horizontal ? screenSize.height * 0.18 : 154.0,
      margin: horizontal
        ? new EdgeInsets.only(left: 46.0)
        : new EdgeInsets.only(top: 65.0),
      decoration: new BoxDecoration(
        color: vivaguaWhite,
        shape: BoxShape.rectangle,
        borderRadius: new BorderRadius.circular(8.0),
        boxShadow: <BoxShadow>[
          new BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            offset: new Offset(0.0, 10.0),
          ),
        ],
      ),
    );


    return new GestureDetector(
      onTap: horizontal
          ? () => Navigator.of(context).push(
            new PageRouteBuilder(
              pageBuilder: (_, __, ___) => new DetailPage(spec),
              transitionsBuilder: (context, animation, secondaryAnimation, child) =>
                new FadeTransition(opacity: animation, child: child),
              ) ,
            )
          : null,
      child: new Container(
        margin: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 24.0,
        ),
        child: new Stack(
          children: <Widget>[
            specCard,
            specThumbnail,
          ],
        ),
      )
    );
  }
}
