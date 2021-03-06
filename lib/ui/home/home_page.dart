import 'package:flutter/material.dart';
import 'home_page_body.dart';
import 'package:vivagua/screens/map_Page/index.dart';

class HomePage extends StatefulWidget {
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {

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
              child: HomePageBody(),
            ),
          ),
          new Offstage(
            offstage: index != 1,
            child: new TickerMode(
              enabled: index == 1,
              child: MapPage(),
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
            icon: Icon(Icons.scatter_plot),
            title: Text("Species")
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            title: Text("Dive Sites")
          ),
        ])
    );
  }
} 