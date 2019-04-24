library globals;

import 'package:flutter/material.dart';

String selectedDivesite = "Howdy";
Color vivaguaBlue = Color.fromRGBO(36, 155, 240, 1);

Color lightPageBackground = Color.fromRGBO(90, 170, 255, 0.5);
Color darkPageBackground = Color.fromRGBO(90, 170, 255, 0.8);

Color vivaguaWhite = Color.fromRGBO(255, 255, 255, 0.92);

String mapDiveSite = "Black Rock";

String databasify(String str) {
  String temp = str
      .replaceAll(new RegExp(r'[^\w\s]+'), '')
      .replaceAll(new RegExp(r' '), '_')
      .toLowerCase();
  print(temp);
  return temp;
}
