import 'package:flutter/material.dart';
import 'dart:async';

class SpeciesSitePage extends StatelessWidget {
  @override
  Widget build(BuildContext context){ // build a widget
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: new BoxDecoration(image: new DecorationImage(
              image: AssetImage('assets/img/home_background.png'), fit: BoxFit.fill)
            ),
          ),
          
        ],

      )
    );
  }
    
}