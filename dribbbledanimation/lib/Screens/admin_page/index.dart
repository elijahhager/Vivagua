import 'package:flutter/material.dart';
import 'styles.dart';
import 'package:flutter/foundation.dart';
import 'dart:async';
import 'package:dribbbledanimation/ui/home/home_page.dart';
import 'package:flutter/services.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import '../../Components/SiteCard.dart';
import 'species_list.dart';



class AdminHomeScreen extends StatefulWidget {
  AdminHomeScreenState createState() => new AdminHomeScreenState();
}

class AdminHomeScreenState extends State<AdminHomeScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Stack(
        children: <Widget>[
          new Offstage(
            offstage: index != 0,
            child: new TickerMode(
              enabled: index == 0,
              child: SpeciesListScreen(),
            ),
          ),
          new Offstage(
            offstage: index != 1,
            child: new TickerMode(
              enabled: index == 1,
              child: SpeciesListScreen(),
            ),
          ) 
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: index,
        onTap: (int index) {
          setState(() {
            this.index = index;
          });
          },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.local_atm),
            title: Text("Species")
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_activity),
            title: Text("Dive Sites")
          ),
        ])
    );
  }
}