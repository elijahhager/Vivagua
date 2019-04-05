import 'package:flutter/material.dart';
import 'List.dart';
import 'SiteCard.dart';


class ListViewContent extends StatelessWidget {
  final Animation<double> listTileWidth;
  final Animation<Alignment> listSlideAnimation;
  final Animation<EdgeInsets> listSlidePosition;
  ListViewContent({
    this.listSlideAnimation,
    this.listSlidePosition,
    this.listTileWidth,
  });

  List<String> items = new List();
  TextEditingController controller = new TextEditingController();
  String filter;

  void buildList() {

    items.add("Sea Turtle");
    items.add("Clown Fish");
    items.add("Sting Ray");
    items.add("Pyjama Shark");
    items.add("Monk Fish Ripcurrent");

  }

  @override
  Widget build(BuildContext context) {
    buildList();
    return (new Stack(
      alignment: listSlideAnimation.value,
      children: <Widget>[
                    new TextField(
                        decoration: new InputDecoration(
                          hintText: "Search...",
                          contentPadding: const EdgeInsets.only(right: 40.0, left: 40.0, top: 10.0, bottom: 10.0)
                        ),
                        textAlign: TextAlign.center,
          controller: controller,
                      ),
                    new Expanded(
                      child: ListView.builder(
                        padding: EdgeInsets.only(top: 20.0),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: items.length,
                        itemBuilder: (BuildContext context, int index) {
                          return filter == null || filter == "" ? 
                          new SiteCard(site_name: items[index], site_location: " 64 Oak River") : items[index].toLowerCase().contains(filter.toLowerCase()) ? 
                          new SiteCard(site_name: items[index], site_location: " 54 Oak Lane") : new Container();
                        },
                      ),
                    ),
                  ],
    ));
  }
}

//For large set of data

//import '../Screens/Home/data.dart';
// DataListBuilder dataListBuilder = new DataListBuilder();
// var i = dataListBuilder.rowItemList.length + 0.5;
// children: dataListBuilder.rowItemList.map((RowBoxData rowBoxData) {
//   return new ListData(
//     title: rowBoxData.title,
//     subtitle: rowBoxData.subtitle,
//     image: rowBoxData.image,
//     width: listTileWidth.value,
//     margin: listSlidePosition.value * (--i).toDouble(),
//   );
// }).toList(),
