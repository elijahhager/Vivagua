class Divesite {
  String name;
  double lat;
  double long;

  Divesite(String s, double lat, double long);

  double get latitude {
    return this.lat;
  }
  double get longitude {
    return this.long;
  }

}