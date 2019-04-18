import 'package:flutter/widgets.dart';

class SpeciesMatch extends ChangeNotifier {
  Decision decision = Decision.undecided;

  void yes(){
    if(decision != Decision.yes){
      decision = Decision.yes;
      notifyListeners();
    }
  }

  void nope(){
    if(decision != Decision.nope){
      decision = Decision.nope;
      notifyListeners();
    }
  }
}

enum Decision {
  undecided,
  nope,
  yes,
}