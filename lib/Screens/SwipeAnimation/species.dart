import 'package:flutter/material.dart';

class Species {
  
  DecorationImage image;
  List<AssetImage> otherImages;
  String name;
  String about;
  String status;
  Color color;

  Species(this.image, this.otherImages, this.name, this.about, this.status, this.color);

}