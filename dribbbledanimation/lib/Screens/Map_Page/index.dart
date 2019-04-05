import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:dribbbledanimation/Routes.dart';
import 'package:dribbbledanimation/Components/WhiteTick.dart';
import 'package:dribbbledanimation/Screens/Map_page/styles.dart';
import 'DiveSite.dart';
//import 'styles.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';

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

  // AutoCompleteTextField searchTextField;
  // GlobalKey<AutoCompleteTextFieldState<DiveSite>> key = new GlobalKey();
  // static List<DiveSite> divesites = [new DiveSite('Black Rock', 16.269053, -86.603612),
  //   new DiveSite('Turtles Crossing', 16.284706, -86.603121),
  //   new DiveSite('The Bight', 16.297822, -86.600038),
  //   new DiveSite('Blue Channel', 16.299490, -86.599759),
  //   new DiveSite('LightHouse Reef', 16.305757, -86.597909),
  //   new DiveSite('DiveMasters Choice', 16.311148, -86.595091),
  //   new DiveSite('Church Reef', 16.287661, -86.573854),];
  // bool loading = false;


  @override
  initState() {
    //super.initState();
    controller.addListener(() {
      setState(() {
        filter = controller.text;
        if("Black Rock".startsWith(filter)){
          curr = new LatLng(16.269053, -86.603612);
        }else if("Turtles Crossing".startsWith(filter)){
          curr = new LatLng(16.284706, -86.603121);
        }else if("The Bight".startsWith(filter)){
          curr = new LatLng(16.297822, -86.600038);
        }else if("Blue Channel".startsWith(filter)){
          curr = new LatLng(16.299490, -86.599759);
        }else if("LightHouse Reef".startsWith(filter)){
          curr = new LatLng(16.305757, -86.597909);
        }else if("DiveMasters Choice".startsWith(filter)){
          curr = new LatLng(16.311148, -86.595091);
        }else if("Church Reef".startsWith(filter)){
          curr = new LatLng(16.287661, -86.573854);
        }
        // switch(filter){
        //   case "Black Rock": { curr = new LatLng(16.269053, -86.603612);}
        //   break;
        //   case "Turtles Crossing": {curr = new LatLng(16.284706, -86.603121);}
        //   break;
        //   case "The Bight": {curr = new LatLng(16.297822, -86.600038);}
        //   break;
        //   case "Blue Channel": {curr = new LatLng(16.299490, -86.599759);}
        //   break;
        //   case "LightHouse Reef": {curr = new LatLng(16.305757, -86.597909);}
        //   break;
        //   case "DiveMasters Choice": {curr = new LatLng(16.311148, -86.595091);}
        //   break;
        //   case "Church Reef": {curr = new LatLng(16.287661, -86.573854);}
        //   break;
        //   default:{}
        //   break;
        // }
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
                color: Colors.blue,
                iconSize: 45.0,
                onPressed: () =>  Routes.navigateTo(context, 'species_page'),
                
              ),
              Text(
                "Black Rock",
                textAlign: TextAlign.center,
                style: new TextStyle(
                  color: Colors.blue,
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
                color: Colors.blue,
                iconSize: 45.0,
                onPressed: () => Routes.navigateTo(context, 'species_page'),
              
              ),
              Text(
                "Turtles Crossing",
                textAlign: TextAlign.center,
                style: new TextStyle(
                  color: Colors.blue,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ]))
            ));
    items.add(new Marker(
        width: 94.0,
        height: 94.0,
        point: new LatLng(16.297822, -86.600038),
        builder: (context) => new Container(
                child: Column(children: <Widget>[
              IconButton(
                icon: Icon(Icons.location_on),
                color: Colors.blue,
                iconSize: 45.0,
                onPressed: () => Routes.navigateTo(context, 'species_page'),
              
              ),
              Text(
                "The Bight",
                textAlign: TextAlign.center,
                style: new TextStyle(
                  color: Colors.blue,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ]))
            ));
    items.add(new Marker(
        width: 94.0,
        height: 94.0,
        point: new LatLng(16.299490, -86.599759),
        builder: (context) => new Container(
                child: Column(children: <Widget>[
              IconButton(
                icon: Icon(Icons.location_on),
                color: Colors.blue,
                iconSize: 45.0,
                onPressed: () => Routes.navigateTo(context, 'species_page'),
              
              ),
              Text(
                "Blue Channel",
                textAlign: TextAlign.center,
                style: new TextStyle(
                  color: Colors.blue,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ]))
            ));
    items.add(new Marker(
        width: 94.0,
        height: 94.0,
        point: new LatLng(16.305757, -86.597909),
        builder: (context) => new Container(
                child: Column(children: <Widget>[
              IconButton(
                icon: Icon(Icons.location_on),
                color: Colors.blue,
                iconSize: 45.0,
                onPressed: () => Routes.navigateTo(context, 'species_page'),
              
              ),
              Text(
                "LightHouse Reef",
                textAlign: TextAlign.center,
                style: new TextStyle(
                  color: Colors.blue,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ]))
            ));
    items.add(new Marker(
        width: 94.0,
        height: 94.0,
        point: new LatLng(16.311148, -86.595091),
        builder: (context) => new Container(
                child: Column(children: <Widget>[
              IconButton(
                icon: Icon(Icons.location_on),
                color: Colors.blue,
                iconSize: 45.0,
                onPressed: () => Routes.navigateTo(context, 'species_page'),
               
              ),
              Text(
                "DiveMasters Choice",
                textAlign: TextAlign.center,
                style: new TextStyle(
                  color: Colors.blue,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ]))
            ));
    items.add(new Marker(
        width: 94.0,
        height: 94.0,
        point: new LatLng(16.287661, -86.573854),
        builder: (context) => new Container(
                child: Column(children: <Widget>[
              IconButton(
                icon: Icon(Icons.location_on),
                color: Colors.blue,
                iconSize: 45.0,
                onPressed: () => Routes.navigateTo(context, 'species_page'),
              
              ),
              Text(
                "Churchs Reef",
                textAlign: TextAlign.center,
                style: new TextStyle(
                  color: Colors.blue,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ]))
            ));
  }

  // Widget row(DiveSite divesite) {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //     children: <Widget>[
  //       Text(
  //         divesite.name,
  //         style: TextStyle(fontSize: 16.0),
  //       ),
  //     ],
  //   );
  // }

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
        body: new Stack(
          alignment: const Alignment(0, -1.0),
          children: <Widget>[
          new Container(
          child: new FlutterMap(
            mapController: mpcontroller,
            options: new MapOptions(
                center: new LatLng(16.269053, -86.603612), minZoom: 10.0),
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
              // child: loading
              // ? CircularProgressIndicator()
              // : searchTextField = AutoCompleteTextField<DiveSite>(
              //     key: key,
              //     clearOnSubmit: false,
              //     suggestions: divesites,
              //     style: TextStyle(color: Colors.black, fontSize: 16.0),
              //     decoration: InputDecoration(
              //       contentPadding: EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 20.0),
              //       hintText: "Search...",
              //       hintStyle: TextStyle(color: Colors.black),
              //     ),
              //     itemFilter: (item, query) {
              //       return item.name
              //           .toLowerCase()
              //           .startsWith(query.toLowerCase());
              //     },
              //     itemSorter: (a, b) {
              //       return a.name.compareTo(b.name);
              //     },
              //     itemSubmitted: (item) {
              //       setState(() {
              //         searchTextField.textField.controller.text = item.name;
              //       });
              //     },
              //     itemBuilder: (context, item) {
              //       // ui for the autocompelete row
              //       return Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //           children: <Widget>[
              //           Text(
              //           item.name,
              //           style: TextStyle(fontSize: 16.0),
              //           ),
              //           ],
              //         );
              //     },
              //   ),
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
            ],)
    );
  }
}
