import 'package:flutter/material.dart';
import 'package:dribbbledanimation/Screens/SwipeAnimation/index.dart';
import 'package:dribbbledanimation/Screens/landing_page/index.dart';
import 'package:dribbbledanimation/Screens/choose_dive_site/index.dart';

class Routes {
  Routes() {
    runApp(new MaterialApp(
      title: "Vivagua",
      debugShowCheckedModeBanner: false,
      home: new LandingScreen(),
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {

          case '/landing':
            return new MyCustomRoute(
              builder: (_) => new LandingScreen(),
              settings: settings,
            );

          case '/choose_dive_site':
            return new MyCustomRoute(
              builder: (_) => new ChooseDiveSiteScreen(),
              settings: settings,
            );

          case '/species':
            return new MyCustomRoute(
              builder: (_) => new CardDemo(),
              settings: settings,
            );
          
        }
      },
    ));
  }
}

class MyCustomRoute<T> extends MaterialPageRoute<T> {
  MyCustomRoute({WidgetBuilder builder, RouteSettings settings})
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    if (settings.isInitialRoute) return child;
    return new FadeTransition(opacity: animation, child: child);
  }
}
