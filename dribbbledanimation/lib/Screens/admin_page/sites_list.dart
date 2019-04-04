import 'package:flutter/material.dart';
import 'styles.dart';
import 'package:flutter/foundation.dart';
import 'dart:async';
import '../../Components/WhiteTick.dart';
import 'package:flutter/services.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'species_row.dart';
import '../../Components/Species.dart';

class SitesListScreen extends StatefulWidget {
  const SitesListScreen({Key key}) : super(key: key);
  @override
  SitesListScreenState createState() => new SitesListScreenState();
}

class SitesListScreenState extends State<SitesListScreen> {
  
  TextEditingController controller = new TextEditingController();
  String filter;

  static final List<Species> specs = [
    const Species(
      id: "11",
      name: "Boardwalk Runoff",
      location: "64 Zoo Lane",
      distance: "54.6m Km",
      gravity: "3.711 m/s ",
      description: "Lorem ipsum...",
      image: "assets/img/mars.png",
    ),
    const Species(
      id: "22",
      name: "Boardwalk Runoff",
      location: "64 Zoo Lane",
      distance: "54.6m Km",
      gravity: "3.711 m/s ",
      description: "Lorem ipsum...",
      image: "assets/img/mars.png",
    ),
    const Species(
      id: "33",
      name: "Boardwalk Runoff",
      location: "64 Zoo Lane",
      distance: "54.6m Km",
      gravity: "3.711 m/s ",
      description: "Lorem ipsum...",
      image: "assets/img/mars.png",
    ),
    const Species(
      id: "44",
      name: "Boardwalk Runoff",
      location: "64 Zoo Lane",
      distance: "54.6m Km",
      gravity: "3.711 m/s ",
      description: "Lorem ipsum...",
      image: "assets/img/mars.png",
    ),
    const Species(
      id: "55",
      name: "Boardwalk Runoff",
      location: "64 Zoo Lane",
      distance: "54.6m Km",
      gravity: "3.711 m/s ",
      description: "Lorem ipsum...",
      image: "assets/img/mars.png",
    )
  ];

  @override
  initState() {

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
            title: Tick(image: home, width: 100.0, height: 30.0),
            centerTitle: true,
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(
              color: Colors.blue, //change your color here
            ),
          ),
          body: new Container(
            child: new Center(
              child: new Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: new Column(
                  
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    
                    new TextField(
                        decoration: new InputDecoration(
                          hintText: "Search dive sites...",
                        ),
                        textAlign: TextAlign.center,
                        controller: controller,
                      ),
                    new Expanded(
                      child: ListView.builder(
                        padding: EdgeInsets.only(top: 20.0),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: specs.length,
                        itemBuilder: (BuildContext context, int index) {
                          
                          return filter == null || filter == "" ? 
                          new SpeciesRow(specs[index]) : specs[index].name.toLowerCase().contains(filter.toLowerCase()) ? 
                          new SpeciesRow(specs[index]) : new Container();
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
