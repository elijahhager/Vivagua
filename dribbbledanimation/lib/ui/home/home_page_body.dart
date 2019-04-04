import 'package:flutter/material.dart';
import 'package:dribbbledanimation/model/planets.dart';
import 'package:dribbbledanimation/ui/common/plannet_summary.dart';
import 'package:dribbbledanimation/Components/WhiteTick.dart';
import 'styles.dart';

class HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
            title: Tick(image: home, width: 100.0, height: 30.0),
            centerTitle: true,
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(
              color: Colors.blue, //change your color here
            ),
          ),
      body: new Container(
        color: Color.fromRGBO(90, 170, 255, 0.5),
        child: new CustomScrollView(
          scrollDirection: Axis.vertical,
          shrinkWrap: false,
          
          slivers: <Widget>[
            new SliverPadding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              sliver: new SliverList(
                delegate: new SliverChildBuilderDelegate(
                    (context, index) => new PlanetSummary(planets[index]),
                  childCount: planets.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
