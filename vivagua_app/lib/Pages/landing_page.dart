import 'package:flutter/material.dart';
import 'dart:async';


class LandingPage extends StatelessWidget {
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

          Positioned(child: Image.asset('assets/img/Vivagua logo.png', scale: 1.8), top: 200, left: 190),
          
          Positioned(child: new StartButton(), top: 600, left: 200),

        ],



      )
    );
  }
}

class StartButton extends StatefulWidget{
  @override
  StartButtonState createState() => new StartButtonState();
}
class StartButtonState extends State<StartButton>{

  void onPressed(){
    setState((){

    });
  }

  @override
  Widget build(BuildContext context){
    return new RaisedButton(

      child: new Text("Log a Dive!", style: new TextStyle(color: Colors.white, fontSize: 32, fontStyle: FontStyle.italic)),
      color: const Color(0xff33ebff),
      onPressed: onPressed,
    );
  }
}