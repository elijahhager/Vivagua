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
    items.add("Dive Site #1");
    items.add("Dive Site #2");
    items.add("Dive Site #3");
    items.add("Dive Site #1");
    items.add("Dive Site #2");
    items.add("Dive Site #3");
    items.add("Dive Site #1");

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
          body: new Container(
            child: new Center(
              child: new Padding(
                padding: EdgeInsets.all(20.0),
                child: new Column(
                  
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new Tick(image: logo_darker),
                    new Text(
                      "Find your divesite",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24.0
                      ),
                    ),
                    new TextField(
                        decoration: new InputDecoration(
                          hintText: "Search your divesite",
                          contentPadding: const EdgeInsets.only(right: 40.0, left: 40.0, top: 20.0, bottom: 10.0)
                        ),
                        textAlign: TextAlign.center,
          controller: controller,
                      ),
                    new Expanded(
                      child: ListView.builder(
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
