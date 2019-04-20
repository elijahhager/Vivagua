import 'package:flutter/material.dart';
import 'package:vivagua/Screens/landing_page/index.dart';
import 'package:vivagua/Screens/choose_dive_site/index.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:vivagua/ui/home/home_page.dart';
import 'package:vivagua/ui/home/home_page_body.dart';
import 'package:vivagua/ui/home/dive_site_specific.dart';




class Routes {

  static final Router _router = new Router();

  static void initRoutes() {

    _router.define('landing', handler: new Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
      return new LandingScreen();
    }));

    _router.define('choose_dive_site', handler: new Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
      return new ChooseDiveSiteScreen();
    }));

    _router.define('species_page', handler: new Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
      return new HomePageBody();
    }));

    _router.define('admin_home', handler: new Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
      return new HomePage();
    }));

    _router.define('dive_site_specific', handler: new Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
      return new DiveSiteSpecificBody();
    }));

  }

  static void navigateTo(context, String route, {TransitionType transition, bool clear: false}) {
    _router.navigateTo(context, route, transition: transition, clearStack: clear);
  }
  
}