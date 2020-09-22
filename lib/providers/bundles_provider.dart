
import 'package:flutter/cupertino.dart';
import 'package:tourism/providers/bundle.dart';

class BundlesProvider with ChangeNotifier{

  List<Bundle> _itemsBundle = bundles ;

  List<Bundle> get itemsBundle {
    return [..._itemsBundle];
  }

  Bundle findById(int id){
    return _itemsBundle.firstWhere((prod) => prod.id == id ) ;
  }

}