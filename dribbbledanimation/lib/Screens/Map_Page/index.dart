import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => new _MapPageState();
}
 
class _MapPageState extends State<MapPage> {

  List<Marker> items = [];
  @override
  initState() {

    items.add(new Marker(width: 94.0,height: 94.0,point: new LatLng(16.269053, -86.603612),
                    builder: (context) => new Container(
                          child: Column(
                            children: <Widget>[
                              IconButton(icon: Icon(Icons.location_on), color: Colors.blue, iconSize: 45.0,
                              onPressed: () {
                                print('Black Rock');
                              },),
                              Text("Black Rock", textAlign: TextAlign.center, style: new TextStyle(color: Colors.blue, fontSize: 14, fontWeight: FontWeight.bold,),),
                              ]
                          ))));
    items.add(new Marker(width: 94.0,height: 94.0,point: new LatLng(16.284706, -86.603121),
                    builder: (context) => new Container(
                          child: Column(
                            children: <Widget>[
                              IconButton(icon: Icon(Icons.location_on), color: Colors.blue, iconSize: 45.0,
                              onPressed: () {
                                print('Turtles Crossing');
                              },),
                              Text("Turtles Corssing", textAlign: TextAlign.center, style: new TextStyle(color: Colors.blue, fontSize: 14, fontWeight: FontWeight.bold,),),
                              ]
                          ))));
    items.add(new Marker(width: 45.0,height: 45.0,point: new LatLng(16.297822, -86.600038),
                    builder: (context) => new Container(
                          child: IconButton(icon: Icon(Icons.location_on), color: Colors.blue, iconSize: 45.0,
                            onPressed: () {
                              print('The Bight');
                            },),)));
    items.add(new Marker(width: 45.0,height: 45.0,point: new LatLng(16.299490, -86.599759),
                    builder: (context) => new Container(
                          child: IconButton(icon: Icon(Icons.location_on), color: Colors.blue, iconSize: 45.0,
                            onPressed: () {
                              print('Blue Channel');
                            },),)));
    items.add(new Marker(width: 45.0,height: 45.0,point: new LatLng(16.305757, -86.597909),
                    builder: (context) => new Container(
                          child: IconButton(icon: Icon(Icons.location_on), color: Colors.blue, iconSize: 45.0,
                            onPressed: () {
                              print('Lighthouse Reef');
                            },),)));
    items.add(new Marker(width: 45.0,height: 45.0,point: new LatLng(16.311148, -86.595091),
                    builder: (context) => new Container(
                          child: IconButton(icon: Icon(Icons.location_on), color: Colors.blue, iconSize: 45.0,
                            onPressed: () {
                              print('DiveMasters Choice');
                            },),)));
    items.add(new Marker(width: 45.0,height: 45.0,point: new LatLng(16.287661, -86.573854),
                    builder: (context) => new Container(
                          child: IconButton(icon: Icon(Icons.location_on), color: Colors.blue, iconSize: 45.0,
                            onPressed: () {
                              print('Churchs Reef');
                            },),)));
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(title: new Text('DiveSite Map')),
        body: new FlutterMap(
           options: new MapOptions( 
                center: new LatLng(16.269053, -86.603612), minZoom: 10.0),
            layers: [
              new TileLayerOptions(
                  //urlTemplate: "https://api.mapbox.com/v4/{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}",
                  urlTemplate: "https://api.mapbox.com/styles/v1/vivagua/cju23i32k1vcl1fo1y50uw0u5/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1Ijoidml2YWd1YSIsImEiOiJjanUxcTE3bGswNGF2M3lwYWwydzh1OTF5In0.cVUTQYcE8GdhF8baIIhP_w",
                  additionalOptions: {
                    'accessToken': 'pk.eyJ1Ijoidml2YWd1YSIsImEiOiJjanUxcTE3bGswNGF2M3lwYWwydzh1OTF5In0.cVUTQYcE8GdhF8baIIhP_w',
                    'id': 'mapbox.streets',
                  },),
              new MarkerLayerOptions(markers: items),
            ]));
  }
}