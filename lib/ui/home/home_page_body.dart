import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/material.dart';
import 'package:vivagua/ui/common/spec_summary.dart';
import 'package:vivagua/components/WhiteTick.dart';
import 'package:vivagua/styles.dart';
//import 'package:vivagua/ui/home/pdf_tools.dart';

class HomePageBody extends StatelessWidget {
  void _successDialog(BuildContext context) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Success!"),
          content: Container(
            height: 100.0,
            width: 60.0,
            child: ListView(
              children: <Widget>[
                new Text("Remember to check your spam folder."),
              ],
            ),
          ),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showDialog(BuildContext context) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Export Data to Email"),
          content: Container(
            height: 100.0,
            width: 60.0,
            child: ListView(
              children: <Widget>[
                new Text(
                    "Enter your email to receive a PDF version of these statistics."),
                new TextField(
                  decoration: const InputDecoration(labelText: "Email: "),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            new FlatButton(
              child: new Text("Send"),
              onPressed: () {
<<<<<<< HEAD
                //sendEmail();
=======
                sendEmail();
                Navigator.of(context).pop();
>>>>>>> 8b5744e42994ce208bcf3905a380deb632b958dc
              },
            ),
          ],
        );
      },
    );
  }

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
      floatingActionButton: Container(
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(color: Colors.black12, blurRadius: 5.0, spreadRadius: 1.0)
          ],
        ),
        width: 100.0,
        height: 40.0,
        child: new RawMaterialButton(
          shape: new CircleBorder(),
          elevation: 1.0,
          child: Text("EXPORT",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400)),
          onPressed: () {
            _showDialog(context);
          },
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
