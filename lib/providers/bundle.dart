import 'package:flutter/cupertino.dart';

class Bundle with ChangeNotifier{

  final int id;
  final String firstPlaceName;
  final String firstPlaceImagePath;
  final String secPlaceName;
  final String secPlaceImagePath;
  final String description;
  final int price;
  final int points;

  Bundle(
      { this.id,
        this.firstPlaceName,
        this.firstPlaceImagePath,
        this.secPlaceName,
        this.secPlaceImagePath,
        this.description,
        this.price,
        this.points
      });
}

final bundles = [
  Bundle(
      id: 1,
      firstPlaceName: "Baron",
      firstPlaceImagePath: "assets/images/Baron.png",
      secPlaceName: "alex",
      secPlaceImagePath: "assets/images/alex.png",
      description:
      "Baron Empain's palace, with its Indian style, and its tower stands out in the desert landscape",
      price: 90,
      points: 60),
  Bundle(
      id: 1,
      firstPlaceName: "Abdeen",
      firstPlaceImagePath: "assets/images/abdeen.png",
      secPlaceName: "Sewa",
      secPlaceImagePath: "assets/images/sewa.png",
      description:
      "Baron Empain's palace, with its Indian style, and its tower stands out in the desert landscape, is distinct from the rest of the city. ",
      price: 110,
      points: 90),
];
