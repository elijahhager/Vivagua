import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vivagua/ui/common/spec_summary.dart';
import 'package:vivagua/components/WhiteTick.dart';
import 'package:vivagua/styles.dart';

class HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return new Scaffold(
      appBar: AppBar(
        title: Text(
          "species",
          style: TextStyle(
              color: Colors.blue,
              fontFamily: 'Overpass ExtraLight',
              fontWeight: FontWeight.w500,
              fontSize: screenSize.width * 0.07),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.blue, //change your color here
        ),
      ),
      body: new Container(

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
                          (context, index) =>
                              new SpecSummary(snapshot.data.documents[index]),
                          childCount: snapshot.data.documents.length,
                        ),
                      ),
                    ),
                  ],
                );
              })),
    );
  }
}
