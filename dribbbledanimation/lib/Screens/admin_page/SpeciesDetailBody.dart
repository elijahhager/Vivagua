import 'package:flutter/material.dart';
import 'Theme.dart' as Theme;
import '../../Components/Species.dart';
import 'package:dribbbledanimation/Routes.dart';

class SpeciesDetailBody extends StatelessWidget {
  final Species species;

  SpeciesDetailBody(this.species);

  @override
  Widget build(BuildContext context) {

    final speciesThumbnail = new Container(
      alignment: new FractionalOffset(0.5, 0.5),
      margin:EdgeInsets.only(bottom: 20.0),
      child: new Hero(
        tag: 'species-icon-${species.id}',
        child: new Image(
          image: new AssetImage(species.image),
          height: Theme.Dimens.speciesHeight,
          width: Theme.Dimens.speciesWidth,
        ),
      ),
    );

    final speciesCard = new Container(
      alignment: new FractionalOffset(2, 2),
      margin: const EdgeInsets.only(left: 20.0, right: 20.0),
      decoration: new BoxDecoration(
        color: Theme.Colors.speciesCard,
        shape: BoxShape.rectangle,
        borderRadius: new BorderRadius.circular(8.0),
        // boxShadow: <BoxShadow>[
        //   new BoxShadow(color: Colors.black,
        //     blurRadius: 10.0,
        //     offset: new Offset(0.0, 10.0))
        // ],
      ),
      child: new Container(
        margin: const EdgeInsets.only(top: 16.0),
        constraints: new BoxConstraints.expand(),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Text(species.name, style: Theme.TextStyles.speciesTitle),
            new Text(species.location, style: Theme.TextStyles.speciesLocation),
            new Container(
              color: const Color(0xFF00C6FF),
              width: 24.0,
              height: 1.0,
              margin: const EdgeInsets.symmetric(vertical: 8.0)
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Icon(Icons.location_on, size: 14.0,
                  color: Theme.Colors.speciesDistance),
                new Text(
                  species.distance, style: Theme.TextStyles.speciesDistance),
                new Container(width: 24.0),
                new Icon(Icons.flight_land, size: 14.0,
                  color: Theme.Colors.speciesDistance),
                new Text(
                  species.gravity, style: Theme.TextStyles.speciesDistance),
              ],
            )
          ],
        ),
      ),
    );

    return new Container(
      height: 150.0,
      margin: const EdgeInsets.only(top: 16.0, bottom: 8.0),
      child: new FlatButton(
        child: new Stack(
          children: <Widget>[
            speciesCard,
            speciesThumbnail,
          ],
        ),
      ),
    );
  }
}