import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:dribbbledanimation/Routes.dart';
import 'package:dribbbledanimation/Components/WhiteTick.dart';
import 'package:dribbbledanimation/Screens/Map_page/styles.dart';


class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => new _MapPageState();
}

class _MapPageState extends State<MapPage> {
  List<Marker> items = [];
  MapController mpcontroller = new MapController();
  LatLng curr = new LatLng(16.269053, -86.603612);
  TextEditingController controller = new TextEditingController();
  String filter;

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

    items.add(new Marker(
        width: 94.0,
        height: 94.0,
        point: new LatLng(16.269053, -86.603612),
        builder: (context) => new Container(
                child: Column(children: <Widget>[
              IconButton(
                icon: Icon(Icons.location_on),
                color: Colors.red,
                iconSize: 45.0,
                onPressed: () => Routes.navigateTo(context, 'species_page'),
              ),
              Text(
                "Black Rock",
                textAlign: TextAlign.center,
                style: new TextStyle(
                  color: Colors.red,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ]))));
    items.add(new Marker(
        width: 94.0,
        height: 94.0,
        point: new LatLng(16.284706, -86.603121),
        builder: (context) => new Container(
                child: Column(children: <Widget>[
              IconButton(
                icon: Icon(Icons.location_on),
                color: Colors.red,
                iconSize: 45.0,
                onPressed: () => Routes.navigateTo(context, 'species_page'),
              ),
              Text(
                "Turtles Crossing",
                textAlign: TextAlign.center,
                style: new TextStyle(
                  color: Colors.red,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ]))));
    items.add(new Marker(
        width: 94.0,
        height: 94.0,
        point: new LatLng(16.297822, -86.600038),
        builder: (context) => new Container(
                child: Column(children: <Widget>[
              IconButton(
                icon: Icon(Icons.location_on),
                color: Colors.red,
                iconSize: 45.0,
                onPressed: () => Routes.navigateTo(context, 'species_page'),
              ),
              Text(
                "The Bight",
                textAlign: TextAlign.center,
                style: new TextStyle(
                  color: Colors.red,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ]))));
    items.add(new Marker(
        width: 94.0,
        height: 94.0,
        point: new LatLng(16.299490, -86.599759),
        builder: (context) => new Container(
                child: Column(children: <Widget>[
              IconButton(
                icon: Icon(Icons.location_on),
                color: Colors.red,
                iconSize: 45.0,
                onPressed: () => Routes.navigateTo(context, 'species_page'),
              ),
              Text(
                "Blue Channel",
                textAlign: TextAlign.center,
                style: new TextStyle(
                  color: Colors.red,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ]))));
    items.add(new Marker(
        width: 94.0,
        height: 94.0,
        point: new LatLng(16.305757, -86.597909),
        builder: (context) => new Container(
                child: Column(children: <Widget>[
              IconButton(
                icon: Icon(Icons.location_on),
                color: Colors.red,
                iconSize: 45.0,
                onPressed: () => Routes.navigateTo(context, 'species_page'),
              ),
              Text(
                "LightHouse Reef",
                textAlign: TextAlign.center,
                style: new TextStyle(
                  color: Colors.red,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ]))));
    items.add(new Marker(
        width: 94.0,
        height: 94.0,
        point: new LatLng(16.311148, -86.595091),
        builder: (context) => new Container(
                child: Column(children: <Widget>[
              IconButton(
                icon: Icon(Icons.location_on),
                color: Colors.red,
                iconSize: 45.0,
                onPressed: () => Routes.navigateTo(context, 'species_page'),
              ),
              Text(
                "DiveMasters Choice",
                textAlign: TextAlign.center,
                style: new TextStyle(
                  color: Colors.red,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ]))));
    items.add(new Marker(
        width: 94.0,
        height: 94.0,
        point: new LatLng(16.287661, -86.573854),
        builder: (context) => new Container(
                child: Column(children: <Widget>[
              IconButton(
                icon: Icon(Icons.location_on),
                color: Colors.red,
                iconSize: 45.0,
                onPressed: () => Routes.navigateTo(context, 'species_page'),
              ),
              Text(
                "Churchs Reef",
                textAlign: TextAlign.center,
                style: new TextStyle(
                  color: Colors.red,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ]))));
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
        floatingActionButton: Container(
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [BoxShadow(
            color: Colors.black12,
            blurRadius: 5.0,
            spreadRadius: 1.0
          )],
        ),
        width: 100.0,
        height: 40.0,
        child: new RawMaterialButton(
          shape: new CircleBorder(),
          elevation: 1.0,
          child: Text("EXPORT", style: TextStyle(color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.w400)),
          onPressed: () {},
        ),
        ),
        body: new Stack(
          alignment: const Alignment(0, -1.0),
          children: <Widget>[
            new Container(
                child: new FlutterMap(
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
                  new MarkerLayerOptions(markers: items),
                ])),
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
