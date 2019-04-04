import 'package:flutter/material.dart';
import 'package:dribbbledanimation/Screens/landing_page/index.dart';
import 'package:dribbbledanimation/Screens/admin_page/index.dart';
import 'package:dribbbledanimation/Screens/choose_dive_site/index.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import './Screens/admin_page/SpeciesDetailPage.dart';
import 'package:dribbbledanimation/ui/home/home_page.dart';
import 'package:dribbbledanimation/ui/home/home_page_body.dart';



class Routes {

  static final Router _router = new Router();

  static var speciesDetailHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, dynamic> params) {
      debugPrint(params["id"].toString().substring(1, params["id"].toString().length-1));
      return new SpeciesDetailPage(params["id"].toString().substring(1, params["id"].toString().length-1));
    });

  static void initRoutes() {

    _router.define("/detail/:id", handler: speciesDetailHandler);

    _router.define("/detail/:id", handler: new Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
      return new SpeciesDetailPage(params["id"]);
    }));
    
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

  }

  static void navigateTo(context, String route, {TransitionType transition}) {
    _router.navigateTo(context, route, transition: transition);
  }
  
}