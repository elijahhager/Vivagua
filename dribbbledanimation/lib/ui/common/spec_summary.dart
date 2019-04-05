import 'package:flutter/material.dart';
import 'package:dribbbledanimation/model/specs.dart';
import 'package:dribbbledanimation/ui/common/separator.dart';
import 'package:dribbbledanimation/ui/detail/detail_page.dart';
import 'package:dribbbledanimation/styles.dart';
import 'package:dribbbledanimation/globals.dart';

class SpecSummary extends StatelessWidget {

  final Spec spec;
  final bool horizontal;

  SpecSummary(this.spec, {this.horizontal = true});

  SpecSummary.vertical(this.spec): horizontal = false;

  @override
  Widget build(BuildContext context) {

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
        
          tag: "spec-hero-${spec.id}",
          child: new Image(
            
            image: new AssetImage(spec.image),      
            height: 91.0,
            width: 91.0,
          ),
        ),
    ));



    Widget _specValue({String value, String image}) {
      return new Container(
        child: new Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new Image.asset(image, height: 12.0),
            new Container(width: 8.0),
            new Text(value, style: Style.smallTextStyle),
          ]
        ),
      );
    }


    final specCardContent = new Container(
      margin: new EdgeInsets.fromLTRB(horizontal ? 76.0 : 16.0, horizontal ? 16.0 : 42.0, 16.0, 16.0),
      constraints: new BoxConstraints.expand(),
      child: new Column(
        crossAxisAlignment: horizontal ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: <Widget>[
          new Container(height: 4.0),
          new Text(spec.name, style: Style.titleTextStyle),
          new Container(height: 10.0),
          new Text(spec.location, style: Style.commonTextStyle),
          new Separator(),
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Expanded(
                flex: horizontal ? 1 : 0,
                child: _specValue(
                  value: spec.status,
                  image: 'assets/img/ic_gravity.png')

              ),
              new Container(
                width: horizontal ? 8.0 : 32.0,
              ),
              new Expanded(
                  flex: horizontal ? 1 : 0,
                  child: _specValue(
                  value: spec.nativity,
                  image: 'assets/img/ic_distance.png')
              )
            ],
          ),
        ],
      ),
    );


    final specCard = new Container(
      child: specCardContent,
      height: horizontal ? 124.0 : 154.0,
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
