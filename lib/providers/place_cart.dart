import 'package:flutter/cupertino.dart';

class PlaceCart with ChangeNotifier {

  final String id;
  final String title;
  final String imagePath;
  int adults;
  int children;
  final double price;
  DateTime selectTime ;
  // double totalPrice ;

  PlaceCart({
    this.id,
    this.title,
    this.imagePath,
    this.adults = 0 ,
    this.children = 0 ,
    this.price ,
    this.selectTime,
    // this.totalPrice = 0,
  });


  int get numberAdults {
    return adults ;
  }

  int get numberChildren {
    return children ;
  }

  DateTime get time {
    return selectTime ;
  }



  void clear(){
    adults =  0 ;
    children = 0 ;
  }


  int get totalToPlace {
    int total ;
    total = adults;
    return total ;
  }

  void incrementChildren() {
    children ++ ;
    notifyListeners();
  }

  void incrementAdult() {
    adults ++ ;
    notifyListeners();
  }

  void decreaseAdult() {
    if ( adults > 0) {
      adults -- ;
    }
    notifyListeners();
  }

  void decreaseChildren() {
    if ( children > 0) {
      children -- ;
    }
    notifyListeners();
  }
}