import 'package:flutter/material.dart';
import '../../Components/Species.dart';
import '../../Components/SpeciesDao.dart';
import 'DetailAppBar.dart';
import 'SpeciesDetailBody.dart';

class SpeciesDetailPage extends StatelessWidget {

  final Species species;

  SpeciesDetailPage(String id) :
    species = SpeciesDao.getSpeciesById(id);

  @override
  Widget build(BuildContext context) {
    print("on the way");
    return new Scaffold(
      body: new Stack(
        children: <Widget>[
          new SpeciesDetailBody(species),
          new DetailAppBar(),
        ],
      ),
    );
  }
}
