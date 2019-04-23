import 'package:flutter/material.dart';

List<AssetImage> tempList = [
  new AssetImage('assets/green_turtle.jpg')
];

DecorationImage lil_whale = new DecorationImage(
  image: new ExactAssetImage('assets/lil_whale.png'),
  fit: BoxFit.fill,
);

DecorationImage which = new DecorationImage(
  image: new ExactAssetImage('assets/which.png'),
  fit: BoxFit.fill,
);
DecorationImage tinyLogo = new DecorationImage(
  image: new ExactAssetImage('assets/logo.png'),
  fit: BoxFit.fill,
);

ImageProvider avatar1 = new ExactAssetImage('assets/avatars/avatar-1.jpg');
ImageProvider avatar2 = new ExactAssetImage('assets/avatars/avatar-2.jpg');
ImageProvider avatar3 = new ExactAssetImage('assets/avatars/avatar-3.jpg');
ImageProvider avatar4 = new ExactAssetImage('assets/avatars/avatar-4.jpg');
ImageProvider avatar5 = new ExactAssetImage('assets/avatars/avatar-5.jpg');
ImageProvider avatar6 = new ExactAssetImage('assets/avatars/avatar-6.jpg');
