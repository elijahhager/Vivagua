import 'package:flutter/material.dart';
import 'species.dart';

List<AssetImage> tempList = [
  new AssetImage('assets/green_turtle.jpg')
];

DecorationImage lil_whale = new DecorationImage(
  image: new ExactAssetImage('assets/lil_whale.png'),
  fit: BoxFit.fill,
);

Species species1 = new Species(
  new DecorationImage(
  image: new ExactAssetImage('assets/green_turtle.jpg'),
  fit: BoxFit.fill,
  ),
  tempList,
  'Green Turtle',
  'The Green sea turtle (Chelonia mydas), also known as the Green turtle, Black (sea) turtle or Pacific green turtle, is a large sea turtle of the family Cheloniidae. It is the only species in the genus Chelonia. Its range extends throughout tropical and subtropical seas around the world, with two distinct populations in the Atlantic and Pacific Oceans, but it is also found in the Indian Ocean. The common name comes from the usually green fat found beneath its carapace; these turtles shells are olive to black.',
  'Vulnerable',
  new Color(0xfff49842)
);

Species species2 = new Species(
  new DecorationImage(
  image: new ExactAssetImage('assets/lionfish.jpg'),
  fit: BoxFit.fill,
  ),
  tempList,
  'Lionfish',
  'Lionfish do not belong in the tropical Atlantic. Their natural domain is in the South Pacific and Indian Oceans, where they are a normal and healthy part of reef ecosystems. But about 30 years ago, the red-and-white striped fish showed up off the Florida coast. They’ve expanded quickly since, bulldozing native fish populations in the Caribbean and up the Eastern Seaboard.',
  'Least Concern',
  new Color(0xff24ba1f)
);

Species species3 = new Species(
  new DecorationImage(
  image: new ExactAssetImage('assets/parrotfish.jpg'),
  fit: BoxFit.fill,
  ),
  tempList,
  'Parrot Fish',
  'Parrotfish are named for their dentition, which is distinct from other fish, including other labrids. Their numerous teeth are arranged in a tightly packed mosaic on the external surface of their jaw bones, forming a parrot-like beak with which they rasp algae from coral and other rocky substrates.',
  'Vulnerable',
  new Color(0xfff49842)
);

Species species4 = new Species(
  new DecorationImage(
  image: new ExactAssetImage('assets/lined_seahorse.jpg'),
  fit: BoxFit.fill,
  ),
  tempList,
  'Lined Seahorse',
  'These specialized fish are poor swimmers and rely on their coloring and texture to camouflage themselves among coral, seagrass, or mangroves where they ambush much smaller prey by sucking them into their toothless snouts. Because of their excellent camouflage, and their body structure of bony plates, they have little danger of predation, but humans collect them for traditional medicine and the aquarium trade.',
  'Near Threatened',
  new Color(0xff13bf88)
);

Species species5 = new Species(
  new DecorationImage(
  image: new ExactAssetImage('assets/hawksbill_turtle.jpg'),
  fit: BoxFit.fill,
  ),
  tempList,
  'Hawksbill Turtle',
  'Hawksbills are named for their narrow, pointed beak. They also have a distinctive pattern of overlapping scales on their shells that form a serrated-look on the edges. These colored and patterned shells make them highly-valuable and commonly sold as "tortoiseshell" in markets. They feed mainly on sponges by using their narrow pointed beaks to extract them from crevices on the reef, but also eat sea anemones and jellyfish.',
  'Critically Endangered',
  new Color(0xffe51926)
);

Species species6 = new Species(
  new DecorationImage(
  image: new ExactAssetImage('assets/mutton_snapper.jpg'),
  fit: BoxFit.fill,
  ),
  tempList,
  'Mutton Snapper',
  'The mutton snapper is a species of snapper native to the Atlantic coastal waters of the Americas from Massachusetts to southern Brazil, including the Caribbean Sea and the Gulf of Mexico. Mutton snapper, especially adults, tend to be solitary, but can be seen in smaller schools.',
  'Vulnerable',
  new Color(0xfff49842)
);

Species species7 = new Species(
  new DecorationImage(
  image: new ExactAssetImage('assets/caribbean_reef_shark.jpg'),
  fit: BoxFit.fill,
  ),
  tempList,
  'Caribbean Reef Shark',
  'Measuring up to 3 m (9.8 ft) long, the Caribbean reef shark is one of the largest apex predators in the reef ecosystem, feeding on a variety of fishes and cephalopods. They have been documented resting motionless on the sea bottom or inside caves, unusual behavior for an active-swimming shark. If threatened, it may perform a threat display in which it frequently changes direction and dips its pectoral fins.',
  'Endangered',
  new Color(0xffe51926)
);
DecorationImage image1 = new DecorationImage(
  image: new ExactAssetImage('assets/green_turtle.jpg'),
  fit: BoxFit.fill,
);
DecorationImage image2 = new DecorationImage(
  image: new ExactAssetImage('assets/lionfish.jpg'),
  fit: BoxFit.fill,
);

DecorationImage image3 = new DecorationImage(
  image: new ExactAssetImage('assets/parrotfish.jpg'),
  fit: BoxFit.fill,
);
DecorationImage image4 = new DecorationImage(
  image: new ExactAssetImage('assets/lined_seahorse.jpg'),
  fit: BoxFit.fill,
);
DecorationImage image5 = new DecorationImage(
  image: new ExactAssetImage('assets/hawksbill_turtle.jpg'),
  fit: BoxFit.fill,
);
DecorationImage image6 = new DecorationImage(
  image: new ExactAssetImage('assets/mutton_snapper.jpg'),
  fit: BoxFit.fill,
);
DecorationImage image7 = new DecorationImage(
  image: new ExactAssetImage('assets/caribbean_reef_shark.jpg'),
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
