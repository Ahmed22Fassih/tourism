
import 'package:flutter/material.dart';
import 'package:tourism/providers/place.dart';


class PlacesProvider with ChangeNotifier{

  List<Place> _items = places ;

  List<Place> get items {
    return [..._items];
  }
  List<Place> get favouriteItems {
    return _items.where((prodItem) => prodItem.isFavorite).toList();
  }

  Place findById( String id){
    return _items.firstWhere((prod) => prod.id == id ) ;
  }

  void addProduct(){
    notifyListeners();
  }

}