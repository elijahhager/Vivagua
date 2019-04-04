import 'package:flutter/material.dart';
import 'Species.dart';

class SpeciesDao {

  static final List<Species> specs = [
    const Species(
      id: "1",
      name: "Sea Turtle",
      location: "Milkyway Galaxy",
      distance: "54.6m Km",
      gravity: "3.711 m/s ",
      description: "Lorem ipsum...",
      image: "assets/img/mars.png",
    ),
    const Species(
      id: "2",
      name: "Neptune",
      location: "Milkyway Galaxy",
      distance: "54.6m Km",
      gravity: "3.711 m/s ",
      description: "Lorem ipsum...",
      image: "assets/img/mars.png",
    ),
    const Species(
      id: "3",
      name: "Moon",
      location: "Milkyway Galaxy",
      distance: "54.6m Km",
      gravity: "3.711 m/s ",
      description: "Lorem ipsum...",
      image: "assets/img/mars.png",
    ),
    const Species(
      id: "4",
      name: "Earth",
      location: "Milkyway Galaxy",
      distance: "54.6m Km",
      gravity: "3.711 m/s ",
      description: "Lorem ipsum...",
      image: "assets/img/mars.png",
    ),
    const Species(
      id: "5",
      name: "Mercury",
      location: "Milkyway Galaxy",
      distance: "54.6m Km",
      gravity: "3.711 m/s ",
      description: "Lorem ipsum...",
      image: "assets/img/mars.png",
    ),
  ];

  static Species getSpeciesById(id) {
    return specs
        .where((p) => p.id == id)
        .first;
  }

}