import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tourism/providers/places_provider.dart';
import 'package:tourism/widgets/place_item.dart';

class FavoritePage extends StatefulWidget {

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    final placesDataFavorites = Provider.of<PlacesProvider>(context);
    final placesFavorite = placesDataFavorites.favouriteItems ;
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              "Places Favorite",
              style: TextStyle(fontSize: 16.0, color: Colors.black),
            ),
            backgroundColor: Colors.white,
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.blue),
            centerTitle: true,
          ),
          body:   ListView.builder(
            itemCount: placesFavorite.length,
            itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
              value: placesFavorite[i],
              child: PlaceItem(),
            ),
          ),
      ),
    );
  }
}
