import 'package:flutter/material.dart';
import 'List.dart';
import '../Screens/admin_page/styles.dart';

class ListViewContent extends StatelessWidget {
  final Animation<double> listTileWidth;
  final Animation<Alignment> listSlideAnimation;
  final Animation<EdgeInsets> listSlidePosition;
  ListViewContent({
    this.listSlideAnimation,
    this.listSlidePosition,
    this.listTileWidth,
  });
  @override
  Widget build(BuildContext context) {
    return (new Stack(
      alignment: listSlideAnimation.value,
      children: <Widget>[
        new ListData(
            margin: listSlidePosition.value * 5.5,
            width: listTileWidth.value,
            title: "Sea turtles",
            subtitle: "Trend: ascending",
            image: sea_turtle_image),
        new ListData(
            margin: listSlidePosition.value * 4.5,
            width: listTileWidth.value,
            title: "Clown Fish",
            subtitle: "Trend: declining",
            image: sea_turtle_image),
        new ListData(
            margin: listSlidePosition.value * 3.5,
            width: listTileWidth.value,
            title: "Common Coral",
            subtitle: "Trend: declining",
            image: sea_turtle_image),
        new ListData(
            margin: listSlidePosition.value * 2.5,
            width: listTileWidth.value,
            title: "Sting Ray",
            subtitle: "Trend: declining",
            image: sea_turtle_image),
        new ListData(
            margin: listSlidePosition.value * 1.5,
            width: listTileWidth.value,
            title: "Pyjama Shark",
            subtitle: "Trend: steady",
            image: sea_turtle_image),
        new ListData(
            margin: listSlidePosition.value * 0.5,
            width: listTileWidth.value,
            title: "Monk Fish",
            subtitle: "Trend: ascending",
            image: sea_turtle_image),
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
