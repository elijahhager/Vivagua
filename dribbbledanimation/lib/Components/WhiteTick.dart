import 'package:flutter/material.dart';

class Tick extends StatelessWidget {
  final DecorationImage image;
  final double width;
  final double height;
  Tick({this.image, this.width, this.height});
  @override
  Widget build(BuildContext context) {
    return (new Container(
      width: width,
      height: height,
      alignment: Alignment.center,
      decoration: new BoxDecoration(
        image: image,
      ),
    ));
  }
}
