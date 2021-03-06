import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import '../../Components/WhiteTick.dart';
import 'package:flutter/services.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:vivagua/components/SiteCard.dart';
import 'package:vivagua/styles.dart';

class ChooseDiveSiteScreen extends StatefulWidget {
  const ChooseDiveSiteScreen({Key key}) : super(key: key);
  @override
  ChooseDiveSiteScreenState createState() => new ChooseDiveSiteScreenState();
}

class ChooseDiveSiteScreenState extends State<ChooseDiveSiteScreen> {
  TextEditingController controller = new TextEditingController();
  String filter;

  @override
  initState() {
    controller.addListener(() {
      setState(() {
        filter = controller.text;
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    timeDilation = 0.4;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return new Scaffold(
      appBar: AppBar(
        title: Text(
          "choose divesite",
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
        child: new Center(
          child: new Padding(
            padding: EdgeInsets.all(20.0),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new TextField(
                  decoration: new InputDecoration(
                      hintText: "Search...",
                      contentPadding: const EdgeInsets.only(
                          right: 40.0, left: 40.0, top: 10.0, bottom: 10.0)),
                  textAlign: TextAlign.center,
                  controller: controller,
                ),
                new Expanded(
                  child: StreamBuilder(
                      stream: Firestore.instance
                          .collection('divesites')
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData)
                          return Padding(
                              padding: EdgeInsets.only(top: 40.0),
                              child: Text(
                                'Loading...',
                              ));
                        return ListView.builder(
                          padding: EdgeInsets.only(top: 20.0),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: snapshot.data.documents.length,
                          itemBuilder: (context, index) {
                            return filter == null || filter == ""
                                ? new SiteCard(
                                    site: snapshot.data.documents[index],
                                  )
                                : snapshot.data.documents[index]['name']
                                        .toLowerCase()
                                        .contains(filter.toLowerCase())
                                    ? new SiteCard(
                                        site: snapshot.data.documents[index],
                                      )
                                    : new Container();
                          },
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
