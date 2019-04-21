import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vivagua/ui/common/spec_summary.dart';
import 'package:vivagua/components/WhiteTick.dart';
import 'package:vivagua/styles.dart';

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
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new AssetImage("assets/underwater.jpg"),
            fit: BoxFit.cover,
            colorFilter: new ColorFilter.mode(Colors.white.withOpacity(0.4), BlendMode.dstATop),

          ),
        ),
        child: StreamBuilder(
          stream: Firestore.instance.collection('species').snapshots(),
          builder: (context, snapshot) {

            if (!snapshot.hasData) return Text("Loading...");
            return new CustomScrollView(
              scrollDirection: Axis.vertical,
              shrinkWrap: false,
              
              slivers: <Widget>[
                new SliverPadding(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  sliver: new SliverList(
                    delegate: new SliverChildBuilderDelegate(
                        (context, index) => new SpecSummary(snapshot.data.documents[index]),
                      childCount: snapshot.data.documents.length,
                    ),
                  ),
                ),
              ],
            );
          }

        )

        
        
      ),
    );
  }
}
