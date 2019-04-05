import 'package:flutter/material.dart';
import 'package:dribbbledanimation/globals.dart';

class Style {

  static final baseTextStyle = const TextStyle(
    fontFamily: 'Poppins'
  );

  static final smallTextStyle = commonTextStyle.copyWith(
    fontSize: 9.0,
  );

  static final commonTextStyle = baseTextStyle.copyWith(
    color: Colors.black,
    fontSize: 14.0,
    fontWeight: FontWeight.w400
  );

  static final increaseTextStyle = baseTextStyle.copyWith(
    color: Colors.green,
    fontSize: 18.0,
    fontWeight: FontWeight.w400
  );

  static final decreaseTextStyle = baseTextStyle.copyWith(
    color: Colors.red,
    fontSize: 18.0,
    fontWeight: FontWeight.w400
  );
  
  static final titleTextStyle = baseTextStyle.copyWith(
    color: vivaguaBlue,
    fontSize: 25.0,
    fontWeight: FontWeight.w600
  );

  static final headerTextStyle = baseTextStyle.copyWith(
    color: vivaguaBlue,
    fontSize: 20.0,
    fontWeight: FontWeight.w400
  );
  
}