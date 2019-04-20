import 'package:flutter/material.dart';
import 'package:vivagua/Screens/landing_page/index.dart';
import 'package:vivagua/Routes.dart';

void main() {
  Routes.initRoutes();
  runApp(
    new MaterialApp(
      title: "vivagua",
      home: new LandingScreen(),
    ),
  );
}
