import 'package:flutter/material.dart';
import 'package:dribbbledanimation/Screens/landing_page/index.dart';
import 'package:dribbbledanimation/Routes.dart';

void main() {
  Routes.initRoutes();
  runApp(
    new MaterialApp(
      title: "vivagua",
      home: new LandingScreen(),
    ),
  );
}
