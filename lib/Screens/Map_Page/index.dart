import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:dribbbledanimation/Routes.dart';
import 'package:dribbbledanimation/Components/WhiteTick.dart';
import 'package:dribbbledanimation/Screens/Map_page/styles.dart';
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

  _buildMarkers(QuerySnapshot querySnapshot) {
    List<Marker> items = [];
    for (var d in querySnapshot.documents) {
      items.add(new Marker(
          width: 94.0,
          height: 94.0,
          point: new LatLng(d['location'].latitude, d['location'].longitude),
          builder: (context) => new Container(
                  child: Column(children: <Widget>[
                IconButton(
                  icon: Icon(Icons.location_on),
                  color: Colors.blue,
                  iconSize: 45.0,
                  onPressed: () => Routes.navigateTo(context, 'dive_site_specific'),
                ),
                Text(
                  d['name'],
                  textAlign: TextAlign.center,
                  style: new TextStyle(
                    color: Colors.blue,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ]))));
    }
    return items;
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
  }

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
          ],
        ));
  }
}
