import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:tourism/providers/place_cart.dart';

class Cart with ChangeNotifier {


  Map<DateTime, PlaceCart> _items = {};

  Map<DateTime, PlaceCart> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += ((cartItem.price * cartItem.adults) +
          ((cartItem.price / 2) * cartItem.children));
    });
    return total;
  }


  void addItem(String placeId, double price, String imagePath, String title,
      int adults, int children, DateTime timeSelected) {
    if (_items.containsKey(timeSelected)) {
      _items.update(
          timeSelected,
          (existingCartItem) => PlaceCart(
                id: existingCartItem.id,
                title: existingCartItem.title,
                imagePath: existingCartItem.imagePath,
                price: existingCartItem.price,
                adults: existingCartItem.adults + adults,
                children: existingCartItem.children + children,
                selectTime: existingCartItem.selectTime,
                // totalPrice: existingCartItem.totalAmount,
              ));
    } else {
      _items.putIfAbsent(
          timeSelected,
          () => PlaceCart(
                id: DateTime.now().toString(),
                title: title,
                imagePath: imagePath,
                price: price,
                adults: adults,
                children: children,
                selectTime: timeSelected,
                // totalPrice: totalPrice,
              ));
    }
    notifyListeners();
  }

  void removeItem(DateTime placeId) {
    _items.remove(placeId);
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }
}
