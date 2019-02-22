import 'package:flutter/material.dart';
import 'styles.dart';
import 'package:flutter/foundation.dart';
import 'dart:async';
import '../../Components/WhiteTick.dart';
import 'package:flutter/services.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import '../../Components/SiteCard.dart';

class ChooseDiveSiteScreen extends StatefulWidget {
  const ChooseDiveSiteScreen({Key key}) : super(key: key);
  @override
  ChooseDiveSiteScreenState createState() => new ChooseDiveSiteScreenState();
}

class ChooseDiveSiteScreenState extends State<ChooseDiveSiteScreen> {
  
  List<String> items = new List();
  TextEditingController controller = new TextEditingController();
  String filter;

  @override
  initState() {

    items.add("Turtle Crossing");
    items.add("Hager Boardwalk");
    items.add("Moran Drawstring");
    items.add("Mancuso Waterway");
    items.add("Razzano Ripcurrent");

    controller.addListener(() {
      setState(() {
        filter = controller.text;
      });
    });

  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future<bool> _onWillPop() {
    return showDialog(
          context: context,
          child: new AlertDialog(
            title: new Text('Go back to the start?'),
            actions: <Widget>[
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text('No thanks'),
              ),
              new FlatButton(
                onPressed: () =>
                    Navigator.pushReplacementNamed(context, "/landing"),
                child: new Text('Yep'),
              ),
            ],
          ),
        ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 0.4;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return (new WillPopScope(
        onWillPop: _onWillPop,
        child: new Scaffold(
            appBar: AppBar(
            title: Tick(image: choose, width: 280.0, height: 40.0),
            centerTitle: true,
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(
              color: Colors.blue, //change your color here
            ),
          ),
          body: new Container(
            child: new Center(
              child: new Padding(
                padding: EdgeInsets.all(20.0),
                child: new Column(
                  
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new TextField(
                        decoration: new InputDecoration(
                          hintText: "Search...",
                          contentPadding: const EdgeInsets.only(right: 40.0, left: 40.0, top: 10.0, bottom: 10.0)
                        ),
                        textAlign: TextAlign.center,
          controller: controller,
                      ),
                    new Expanded(
                      child: ListView.builder(
                        padding: EdgeInsets.only(top: 20.0),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: items.length,
                        itemBuilder: (BuildContext context, int index) {
                          return filter == null || filter == "" ? 
                          new SiteCard(site_name: items[index], site_location: " 64 Oak River") : items[index].toLowerCase().contains(filter.toLowerCase()) ? 
                          new SiteCard(site_name: items[index], site_location: " 54 Oak Lane") : new Container();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
    )));
  }
}
