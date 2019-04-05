import 'package:flutter/material.dart';
import 'package:dribbbledanimation/model/specs.dart';
import 'package:dribbbledanimation/ui/common/spec_summary.dart';
import 'package:dribbbledanimation/Components/WhiteTick.dart';
import 'package:dribbbledanimation/styles.dart';

class DiveSiteSpecificBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
            title: Tick(image: divesite, width: 100.0, height: 30.0),
            centerTitle: true,
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(
              color: Colors.blue, //change your color here
            ),
          ),
      body: new Container(
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new AssetImage("assets/underwater.jpg"),
            fit: BoxFit.cover,
            colorFilter: new ColorFilter.mode(Colors.white.withOpacity(0.4), BlendMode.dstATop),

          ),
        ),
        child: new CustomScrollView(
          scrollDirection: Axis.vertical,
          shrinkWrap: false,
          
          slivers: <Widget>[
            new SliverPadding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              sliver: new SliverList(
                delegate: new SliverChildBuilderDelegate(
                    (context, index) => new SpecSummary(specs[index]),
                  childCount: specs.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
