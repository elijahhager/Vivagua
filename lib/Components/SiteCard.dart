import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../globals.dart' as globals;
import '../screens/swipe_animation/index.dart';
import 'package:vivagua/routes.dart';

class SiteCard extends StatelessWidget {
  final DocumentSnapshot site;

  SiteCard({
    @required this.site,
  });

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return new Card(
      elevation: 3.0,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(color: Color.fromRGBO(244, 244, 244, .3)),
        child: new InkWell(
          onTap: () {
            globals.selectedDivesite = this.site['name'];
            Routes.navigateTo(context, "card_demo");
          },
          child: new ListTile(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              leading: Container(
                padding: EdgeInsets.only(right: 12.0),
                decoration: new BoxDecoration(
                    border: new Border(
                        right:
                            new BorderSide(width: 1.0, color: Colors.black))),
                child: Icon(Icons.location_on,
                    color: Colors.blue, size: screenSize.width * 0.055),
              ),
              title: Text(
                site['name'],
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Overpass SemiBold',
                    fontSize: screenSize.width * 0.05),
              ),
              trailing: Icon(Icons.keyboard_arrow_right,
                  color: Colors.black, size: 30.0)),
        ),
      ),
    );
  }
}
