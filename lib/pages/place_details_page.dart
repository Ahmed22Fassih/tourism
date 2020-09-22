import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tourism/providers/places_provider.dart';
import 'package:tourism/widgets/button.dart';

import 'book_now_page.dart';


class PlaceDetailsPage extends StatefulWidget {

  static const routeName = '/routeName';

  @override
  _PlaceDetailsPageState createState() => _PlaceDetailsPageState();
}

class _PlaceDetailsPageState extends State<PlaceDetailsPage> {

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments ;
    final loadedPlace =
        Provider.of<PlacesProvider>(context, listen: false).findById(productId);

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    height: 230.0,
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(
                      loadedPlace.imagePath,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    left: 0.0,
                    bottom: 0.0,
                    child: Container(
                      height: 60.0,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Colors.black, Colors.black12],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 30.0,
                    bottom: 10.0,
                    right: 30.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context, false);
                          },
                          child: Row(
                            children: <Widget>[
                              Icon(Icons.chevron_left, color: Colors.white),
                              SizedBox(width: 6),
                              Text("Places",
                                  style: TextStyle(color: Colors.white)),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: Icon(loadedPlace.isFavorite
                              ? Icons.favorite
                              : Icons.favorite_border),
                          color: Colors.red,
                          onPressed: () {
                            setState(() {
                              loadedPlace.toggleFavoriteStatus();
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    loadedPlace.name,
                    style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      "4",
                      style: TextStyle(
                          fontSize: 15,
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Icon(Icons.star,
                      color: Theme.of(context).primaryColor, size: 20.0),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
                child: Text(
                  "${loadedPlace.description}",
                  textAlign: TextAlign.justify,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(2.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          "Hint:",
                          style: TextStyle(
                              fontSize: 15.0, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 10.0),
                        Text("Ticket to child half to adult "),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      children: <Widget>[
                        Text(
                          "Available :",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15.0),
                        )
                      ],
                    ),
                    SizedBox(height: 10.0),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(4.0),
                height: 200,
                child: GridView(
                  children: loadedPlace.available.map((String value) {
                    return Card(
                      color: Colors.white,
                      margin: EdgeInsets.all(1.0),
                      child: Center(
                        child: Text(
                          value,
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                    childAspectRatio: 5,
                  ),
                ),
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(BookNowPage.routeName , arguments: loadedPlace.id );
                  },
                  child: Button(btnText: "Book Now")),
              SizedBox(height: 25.0),
            ],
          ),
        ),
      ),
    );
  }

}
