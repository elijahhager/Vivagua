class Planet {
  final String id;
  final String name;
  final String location;
  final String distance;
  final String gravity;
  final String description;
  final String image;
  final String picture;

  const Planet({this.id, this.name, this.location, this.distance, this.gravity,
    this.description, this.image, this.picture});
}

List<Planet> planets = [
  const Planet(
    id: "1",
    name: "Sea Turtle",
    location: "Roatan, Honduras",
    distance: "Endangered",
    gravity: "Native",
    description: "Sea turtles are one of the Earth's most ancient creatures. The seven species that can be found today have been around for 110  million years, since the time of the dinosaurs. The sea turtle's shell, or carapace, is streamlined for swimming through the water.",
    image: "assets/hawksbill_turtle_circle.png",
    picture: "https://www.nasa.gov/sites/default/files/thumbnails/image/pia21723-16.jpg"
  ),
  const Planet(
    id: "2",
    name: "Lined Seahorse",
    location: "Roatan, Honduras",
    distance: "Endangered",
    gravity: "Native",
    description: "Sea turtles are one of the Earth's most ancient creatures. The seven species that can be found today have been around for 110  million years, since the time of the dinosaurs. The sea turtle's shell, or carapace, is streamlined for swimming through the water.",
    image: "assets/lined_seahorse_circle.png",
    picture: "https://www.nasa.gov/sites/default/files/styles/full_width_feature/public/images/110411main_Voyager2_280_yshires.jpg"
  ),
  const Planet(
    id: "3",
    name: "Caribbean Shark",
    location: "Roatan, Honduras",
    distance: "Endangered",
    gravity: "Native",
    description: "Sea turtles are one of the Earth's most ancient creatures. The seven species that can be found today have been around for 110  million years, since the time of the dinosaurs. The sea turtle's shell, or carapace, is streamlined for swimming through the water.",
    image: "assets/caribbean_reef_shark_circle.png",
    picture: "https://farm5.staticflickr.com/4086/5052125139_43c31b7012.jpg"
  ),
  const Planet(
    id: "4",
    name: "Lionfish",
    location: "Roatan, Honduras",
    distance: "Abundant",
    gravity: "Non-native",
    description: "Sea turtles are one of the Earth's most ancient creatures. The seven species that can be found today have been around for 110  million years, since the time of the dinosaurs. The sea turtle's shell, or carapace, is streamlined for swimming through the water.",
    image: "assets/img/earth.png",
    picture: "https://www.nasa.gov/sites/default/files/styles/full_width_feature/public/thumbnails/image/iss042e340851_1.jpg"
  ),
  const Planet(
    id: "5",
    name: "Parrot Fish",
    location: "Roatan, Honduras",
    distance: "Endangered",
    gravity: "Native",
    description: "Sea turtles are one of the Earth's most ancient creatures. The seven species that can be found today have been around for 110  million years, since the time of the dinosaurs. The sea turtle's shell, or carapace, is streamlined for swimming through the water.",
    image: "assets/parrot_fish_circle.png",
    picture: "https://c1.staticflickr.com/9/8105/8497927473_2845ae671e_b.jpg"
  ),
];