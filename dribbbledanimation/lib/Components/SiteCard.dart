import 'package:flutter/material.dart';
import '../Screens/landing_page/index.dart';
import '../globals.dart' as globals;
import '../Screens/SwipeAnimation/index.dart';

class SiteCard extends StatelessWidget {
  
  final String site_name;
  final String site_location;

  SiteCard(
      {
      @required this.site_name,
      @required this.site_location,
      });

  @override
  Widget build(BuildContext context) {
    return new InkWell(
      onTap: () {
        globals.selected_dive_site = this.site_name;
        Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CardDemo()),
            );
      },
      child: new Card(
        elevation: 8.0,
        margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
        child: Container(
          decoration: BoxDecoration(color: Color.fromRGBO(244, 244, 244, .3)),
          child: new ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            leading: Container(
              padding: EdgeInsets.only(right: 12.0),
              decoration: new BoxDecoration(
                  border: new Border(
                      right: new BorderSide(width: 1.0, color: Colors.black))),
              child: Icon(Icons.location_on, color: Colors.blue),
            ),
            title: Text(
              site_name,
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            subtitle: Row(
              children: <Widget>[
                Icon(Icons.linear_scale, color: Colors.yellowAccent),
                Text(site_location, style: TextStyle(color: Colors.black))
              ],
            ),
            trailing: Icon(Icons.keyboard_arrow_right, color: Colors.black, size: 30.0)
          ),
        ),
      )
    );
  }
}