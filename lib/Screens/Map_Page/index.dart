import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:vivagua/routes.dart';
import 'DiveSite.dart';
import 'package:vivagua/components/WhiteTick.dart';
import 'package:vivagua/screens/map_page/styles.dart';
import 'package:cloud_functions/cloud_functions.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => new _MapPageState();
}

class _MapPageState extends State<MapPage> {
  MapController mpcontroller = new MapController();
  LatLng curr = new LatLng(16.269053, -86.603612);
  TextEditingController controller = new TextEditingController();
  String filter;

  bool sitesToggle = false;
  var currentSite;
  List<Divesite> diveSites = [];

  void _showSuccessDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Success!"),
          content: new Text("Divesite successfully added."),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
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

  Future<Null> _showDialog(BuildContext context) {
    TextEditingController _nameTextController = new TextEditingController();
    TextEditingController _latitudeTextController = new TextEditingController();
    TextEditingController _longitudeTextController =
        new TextEditingController();

    return showDialog<Null>(
        context: context,
        builder: (BuildContext context) {
          return new AlertDialog(
            title: const Text("Add a divesite"),
            content: Container(
              height: 180.0,
              width: 100.0,
              child: ListView(
                children: <Widget>[
                  new TextField(
                    controller: _nameTextController,
                    decoration: const InputDecoration(labelText: "Name: "),
                  ),
                  new TextField(
                    controller: _latitudeTextController,
                    decoration: const InputDecoration(labelText: "Latitude: "),
                  ),
                  new TextField(
                    controller: _longitudeTextController,
                    decoration: const InputDecoration(labelText: "Longitude: "),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              new FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("Cancel")),
              // This button results in adding the contact to the database
              new FlatButton(
                  onPressed: () {
                    // cloud function being called here. Will this persist offline?
                    CloudFunctions.instance
                        .call(functionName: "addDivesite", parameters: {
                      "name": _nameTextController.text,
                      "longitude": double.parse(_longitudeTextController.text),
                      "latitude": double.parse(_latitudeTextController.text)
                    });
                    Navigator.of(context).pop();
                    _showSuccessDialog();
                  },
                  child: const Text("Confirm"))
            ],
          );
        });
  }

  Widget siteCard(site) {
    if (site != null) {
      return Padding(
          padding: EdgeInsets.only(left: 2.0, top: 10.0),
          child: InkWell(
              onTap: () {
                setState(() {
                  currentSite = site;
                });
                //zoomInMarker(site);
                var loc = new LatLng(currentSite.lat, currentSite.long);
                mpcontroller.move(loc, 17);
              },
              child: Material(
                elevation: 4.0,
                borderRadius: BorderRadius.circular(5.0),
                child: Container(
                    height: 100.0,
                    width: 125.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: Colors.white),
                    child: Center()),
              )));
    }else{
      return Padding(
          padding: EdgeInsets.only(left: 2.0, top: 10.0),
          child: InkWell(
              onTap: () {
              },
              child: Material(
                elevation: 4.0,
                borderRadius: BorderRadius.circular(5.0),
                child: Container(
                    height: 100.0,
                    width: 125.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: Colors.white),
                    child: Center()),
              )));
    }
  }

  _buildMarkers(QuerySnapshot querySnapshot) {
    Size screenSize = MediaQuery.of(context).size;
    List<Marker> items = [];
    for (var d in querySnapshot.documents) {
      // diveSites.add(new Divesite(
      //     d['name'], d['location'].latitude, d['location'].longitude));

      items.add(new Marker(
          width: screenSize.width * 0.06,
          height: screenSize.height * 0.06,
          point: new LatLng(d['location'].latitude, d['location'].longitude),
          builder: (context) => new Container(
                  child: Column(children: <Widget>[
                IconButton(
                  icon: Icon(Icons.location_on),
                  color: Colors.blue,
                  iconSize: screenSize.width * 0.06,
                  onPressed: () =>
                      Routes.navigateTo(context, 'dive_site_specific'),
                ),
                // Text(
                //   d['name'],
                //   textAlign: TextAlign.center,
                //   style: new TextStyle(
                //     color: Colors.blue,
                //     fontSize: screenSize.width * 0.04,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
              ]))));
    }
    //sitesToggle = true;

    return items;
  }

  populateSiteList() {
    Firestore.instance.collection('divesites').getDocuments().then((docs) {
      if (docs.documents.isNotEmpty) {
        setState(() {
          sitesToggle = true;
        });
        for (var d in docs.documents){
          diveSites.add(new Divesite(
          d['name'], d['location'].latitude, d['location'].longitude));
        }
      }
    });

    for (var s in diveSites){
      print(s.toString());
    }
  }

  @override
  initState() {
    //super.initState();
    controller.addListener(() {
      setState(() {
        filter = controller.text;
        if ("Black Rock".startsWith(filter)) {
          curr = new LatLng(16.269053, -86.603612);
        } else if ("Turtles Crossing".startsWith(filter)) {
          curr = new LatLng(16.284706, -86.603121);
        } else if ("The Bight".startsWith(filter)) {
          curr = new LatLng(16.297822, -86.600038);
        } else if ("Blue Channel".startsWith(filter)) {
          curr = new LatLng(16.299490, -86.599759);
        } else if ("LightHouse Reef".startsWith(filter)) {
          curr = new LatLng(16.305757, -86.597909);
        } else if ("DiveMasters Choice".startsWith(filter)) {
          curr = new LatLng(16.311148, -86.595091);
        } else if ("Church Reef".startsWith(filter)) {
          curr = new LatLng(16.287661, -86.573854);
        }
        mpcontroller.move(curr, 18);
      });
    });

    populateSiteList();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return new Scaffold(
        appBar: AppBar(
          title: Text(
            "divesites",
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
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xff2298f2),
          tooltip: "Add Divesite",
          onPressed: () {
            _showDialog(context);
          },
          child: Icon(Icons.add),
        ),
        body: new Stack(
          alignment: const Alignment(0, -1.0),
          children: <Widget>[
            new Container(
                child: StreamBuilder(
                    stream:
                        Firestore.instance.collection('divesites').snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) return Text("Loading...");
                      //_buildMarkers(snapshot.data);
                      return new FlutterMap(
                          mapController: mpcontroller,
                          options: new MapOptions(
                              center: new LatLng(16.269053, -86.603612),
                              minZoom: 10.0),
                          layers: [
                            new TileLayerOptions(
                              //urlTemplate: "https://api.mapbox.com/v4/{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}",
                              urlTemplate:
                                  "https://api.mapbox.com/styles/v1/vivagua/cju23i32k1vcl1fo1y50uw0u5/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1Ijoidml2YWd1YSIsImEiOiJjanUxcTE3bGswNGF2M3lwYWwydzh1OTF5In0.cVUTQYcE8GdhF8baIIhP_w",
                              additionalOptions: {
                                'accessToken':
                                    'pk.eyJ1Ijoidml2YWd1YSIsImEiOiJjanUxcTE3bGswNGF2M3lwYWwydzh1OTF5In0.cVUTQYcE8GdhF8baIIhP_w',
                                'id': 'mapbox.streets',
                              },
                            ),
                            new MarkerLayerOptions(
                                markers: _buildMarkers(snapshot.data)),
                          ]);
                    })
                //
                ),
            new Container(
              child: new TextField(
                decoration: new InputDecoration(
                    hintText: "Search...",
                    contentPadding: const EdgeInsets.only(
                        right: 40.0, left: 40.0, top: 10.0, bottom: 10.0)),
                textAlign: TextAlign.center,
                controller: controller,
                textCapitalization: TextCapitalization.words,
              ),
            ),
            // Positioned(
            //     top: MediaQuery.of(context).size.height - 285.0,
            //     left: 10.0,
            //     child: Container(
            //         height: 125.0,
            //         width: MediaQuery.of(context).size.width,
            //         child: sitesToggle
            //             ? ListView(
            //                 scrollDirection: Axis.horizontal,
            //                 padding: EdgeInsets.all(8.0),
            //                 children: diveSites.map((element) {
            //                   return siteCard(element);
            //                 }).toList(),
            //               )
            //             : Container(height: 1.0, width: 1.0))),
          ],
        ));
  }
}
