import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context){ // build a widget
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,

        children: <Widget>[
          Container(
            decoration: BoxDecoration(image: DecorationImage(
              image: AssetImage('assets/img/home_background.png'), fit: BoxFit.fill)
            ),
          )



        ],



      )
    );
  }
}