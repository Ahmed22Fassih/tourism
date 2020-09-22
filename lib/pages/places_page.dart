import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tourism/providers/places_provider.dart';
import 'package:tourism/widgets/place_item.dart';

class PlacesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final placeData = Provider.of<PlacesProvider>(context);
    final places = placeData.items;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Places",
            style: TextStyle(fontSize: 16.0, color: Colors.black),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.blue),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: places.length,
          itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
            value: places[i],
            child: PlaceItem(),
          ),
        ),
      ),
    );
  }
}

