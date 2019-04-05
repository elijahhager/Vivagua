class Spec {
  final String id;
  final String name;
  final String location;
  final String status;
  final String nativity;
  final String description;
  final String image;

  const Spec({this.id, this.name, this.location, this.status, this.nativity,
    this.description, this.image});
}

List<Spec> specs = [
  const Spec(
    id: "1",
    name: "Sea Turtle",
    location: "Roatan, Honduras",
    status: "Endangered",
    nativity: "Native",
    description: "Sea turtles are one of the Earth's most ancient creatures. The seven species that can be found today have been around for 110  million years, since the time of the dinosaurs. The sea turtle's shell, or carapace, is streamlined for swimming through the water.",
    image: "assets/hawksbill_turtle_circle.png",
  ),
  const Spec(
    id: "2",
    name: "Lined Seahorse",
    location: "Roatan, Honduras",
    status: "Endangered",
    nativity: "Native",
    description: "Sea turtles are one of the Earth's most ancient creatures. The seven species that can be found today have been around for 110  million years, since the time of the dinosaurs. The sea turtle's shell, or carapace, is streamlined for swimming through the water.",
    image: "assets/lined_seahorse_circle.png",
  ),
  const Spec(
    id: "3",
    name: "Caribbean Shark",
    location: "Roatan, Honduras",
    status: "Endangered",
    nativity: "Native",
    description: "Sea turtles are one of the Earth's most ancient creatures. The seven species that can be found today have been around for 110  million years, since the time of the dinosaurs. The sea turtle's shell, or carapace, is streamlined for swimming through the water.",
    image: "assets/caribbean_reef_shark_circle.png",
  ),
  const Spec(
    id: "4",
    name: "Lionfish",
    location: "Roatan, Honduras",
    status: "Abundant",
    nativity: "Non-native",
    description: "Sea turtles are one of the Earth's most ancient creatures. The seven species that can be found today have been around for 110  million years, since the time of the dinosaurs. The sea turtle's shell, or carapace, is streamlined for swimming through the water.",
    image: "assets/lionfish_circle.png",
  ),
  const Spec(
    id: "5",
    name: "Parrot Fish",
    location: "Roatan, Honduras",
    status: "Endangered",
    nativity: "Native",
    description: "Sea turtles are one of the Earth's most ancient creatures. The seven species that can be found today have been around for 110  million years, since the time of the dinosaurs. The sea turtle's shell, or carapace, is streamlined for swimming through the water.",
    image: "assets/parrot_fish_circle.png",
  ),
];