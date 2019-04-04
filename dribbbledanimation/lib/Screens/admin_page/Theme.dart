import 'package:flutter/material.dart';

class Colors {

  const Colors();


  static const Color appBarTitle = const Color(0xFFFFFFFF);
  static const Color appBarIconColor = const Color(0xFFFFFFFF);
  static const Color appBarDetailBackground = const Color(0x00FFFFFF);
  static const Color appBarGradientStart = const Color(0xFF3383FC);
  static const Color appBarGradientEnd = const Color(0xFF00C6FF);

  //static const Color speciesCard = const Color(0xFF434273);
  static const Color speciesCard = const Color.fromRGBO(91, 154, 255, 1);
  //static const Color speciesListBackground = const Color(0xFF3E3963);
  static const Color speciesPageBackground = const Color(0xFF736AB7);
  static const Color speciesTitle = const Color(0xFFFFFFFF);
  static const Color speciesLocation = const Color(0x66FFFFFF);
  static const Color speciesDistance = const Color(0x66FFFFFF);

}

class Dimens {
  const Dimens();

  static const speciesWidth = 100.0;
  static const speciesHeight = 100.0;
}

class TextStyles {

  const TextStyles();

  static const TextStyle appBarTitle = const TextStyle(
    color: Colors.appBarTitle,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
    fontSize: 36.0
  );

  static const TextStyle speciesTitle = const TextStyle(
    color: Colors.speciesTitle,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
    fontSize: 24.0
  );

  static const TextStyle speciesLocation = const TextStyle(
    color: Colors.speciesLocation,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w300,
    fontSize: 14.0
  );

  static const TextStyle speciesDistance = const TextStyle(
    color: Colors.speciesDistance,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w300,
    fontSize: 12.0
  );

}