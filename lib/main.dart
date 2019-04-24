import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vivagua/screens/landing_page/index.dart';
import 'package:vivagua/routes.dart';

void main() {
  Routes.initRoutes();

  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitDown
  // ]);
  
  runApp(
    new MaterialApp(
      title: "vivagua",
      home: new LandingScreen(),
      theme: ThemeData(fontFamily: 'Overpass Regular'),
    ),
  );
}
