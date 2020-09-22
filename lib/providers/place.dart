import 'package:flutter/cupertino.dart';

class Place with ChangeNotifier {
  final String id;
  final String name;
  final String imagePath;
  final String description;
  final List<String> available;
  final String category;
  final double price;
  final double ratings;
  bool isFavorite;

  Place(
      {this.id,
      this.name,
      this.imagePath,
      this.description,
      this.available,
      this.category,
      this.price,
      this.ratings,
      this.isFavorite = false});

  void toggleFavoriteStatus() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}

final places = [
  Place(
    id: '1',
    name: "Baron",
    imagePath: "assets/images/Baron.png",
    description:
        "Baron Empain's palace, with its Indian style, and its tower stands out in the desert landscape, is distinct from the rest of the city. The palace reflects the high status of its owner and marks a major milestone in the urban landscape of Heliopolis. Baron Empain's palace is the most prominent Monuments in the capital, its unique and innovative image attracting crowds of pedestrians on the road.",
    available: [
      "Breakfast&Lunch",
      "WiFi",
      "Car parking",
      "Swimming pool",
      "Kids play area",
      "Dogs Allowed"
    ],
    category: "1",
    price: 20,
    ratings: 99.0,
  ),
  Place(
    id: '2',
    name: "alex",
    imagePath: "assets/images/alex.png",
    description: "adfakadfjkasjteruioierqjthrio",
    available: [
      "Breakfast&Lunch",
      "WiFi",
      "parking",
      "Pool",
      "Kids play area",
      "Dogs Allowed",
      "Cafe"
    ],
    category: "1",
    price: 80,
    ratings: 95.0,
  ),
  Place(
    id: "3",
    name: "Abdeen",
    imagePath: "assets/images/abdeen.png",
    description: "adfakadfjkasjteruioierqjthrio",
    available: [
      "Breakfast&Lunch",
      "WiFi",
      "parking",
      "Pool",
      "Kids play area",
      "Dogs Allowed",
      "Cafe"
    ],
    category: "1",
    price: 150,
    ratings: 85.0,
  ),
  Place(
    id: "4",
    name: "Sewa",
    imagePath: "assets/images/sewa.png",
    description: "adfakadfjkasjteruioierqjthrio",
    available: [
      "Breakfast&Lunch",
      "WiFi",
      "parking",
      "Pool",
      "Kids play area",
      "Dogs Allowed",
      "Cafe"
    ],
    category: "1",
    price: 500,
    ratings: 86.0,
  ),
  Place(
    id: "5",
    name: "Cairo Tower",
    imagePath: "assets/images/tower.png",
    description: "adfakadfjkasjteruioierqjthrio",
    available: [
      "Breakfast&Lunch",
      "WiFi",
      "parking",
      "Pool",
      "Kids play area",
      "Dogs Allowed",
      "Cafe"
    ],
    category: "1",
    price: 20,
    ratings: 99.0,
  ),
];
