import 'package:flutter/material.dart';
import 'package:vivagua/globals.dart';

class Style {

  static final baseTextStyle = const TextStyle(
    fontFamily: 'Overpass SemiBold'
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
    fontSize: 22.0,
    fontWeight: FontWeight.w400
  );

  static final decreaseTextStyle = baseTextStyle.copyWith(
    color: Colors.red,
    fontSize: 22.0,
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

DecorationImage tick = new DecorationImage(
  image: new ExactAssetImage('assets/tick.png'),
  fit: BoxFit.cover,
);

DecorationImage logo = new DecorationImage(
  image: new ExactAssetImage('assets/logo.png'),
  fit: BoxFit.cover,
);

DecorationImage logo_darker = new DecorationImage(
  image: new ExactAssetImage('assets/logo_darker.png'),
  fit: BoxFit.cover,
);

DecorationImage home = new DecorationImage(
  image: new ExactAssetImage('assets/home.png'),
  fit: BoxFit.cover,
);

DecorationImage divesite = new DecorationImage(
  image: new ExactAssetImage('assets/divesite.png'),
  fit: BoxFit.cover,
);

DecorationImage turtle = new DecorationImage(
  image: new ExactAssetImage('assets/img/hawksbill_turtle.jpg'),
  fit: BoxFit.fill,
);

DecorationImage logo_success = new DecorationImage(
  image: new ExactAssetImage('assets/success.png'),
  fit: BoxFit.cover,
);

DecorationImage choose = new DecorationImage(
  image: new ExactAssetImage('assets/choose.png'),
  fit: BoxFit.cover,
);