import 'package:flutter/material.dart';
import './Pages/landing_page.dart';
import './Pages/dive_site_page.dart';

void main(){
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: new LandingPage(),
    routes: <String, WidgetBuilder>{
      "/DiveSitePage": (BuildContext context) => new DiveSitePage()
    }
  ));
} 
