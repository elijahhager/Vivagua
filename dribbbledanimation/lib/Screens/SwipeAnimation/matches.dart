import 'package:flutter/widgets.dart';

class SpeciesMatch extends ChangeNotifier {
  Decision decision = Decision.undecided;

  void yes(){
    if(decision == Decision.undecided){
      decision = Decision.yes;
      notifyListeners();
    }
  }

  void nope(){
    if(decision == Decision.undecided){
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