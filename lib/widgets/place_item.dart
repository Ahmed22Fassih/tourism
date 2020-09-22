import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tourism/pages/place_details_page.dart';
import 'package:tourism/providers/place.dart';

class PlaceItem extends StatefulWidget {
  @override
  _PlaceItemState createState() => _PlaceItemState();
}

class _PlaceItemState extends State<PlaceItem> {
  @override
  Widget build(BuildContext context) {
    final place = Provider.of<Place>(context , listen: false);

    return GestureDetector(
      onTap: (){
        Navigator.of(context).pushNamed(PlaceDetailsPage.routeName , arguments: place.id );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 5.0),
        padding: EdgeInsets.symmetric(vertical: 10.0 , horizontal: 10.0),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(10.0),),
          child: Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height/4,
                width: MediaQuery.of(context).size.width,
                child: Image.asset(place.imagePath,fit: BoxFit.cover),
              ),
              Positioned(
                left: 0.0,
                bottom: 0.0,
                child: Container(
                  height: 60.0,
                  width: 340.0,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [
                          Colors.black , Colors.black12],
                        begin: Alignment.bottomCenter,
                        end:Alignment.topCenter
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 10.0,
                bottom: 10.0,
                right: 10.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(place.name,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Icon(Icons.star,color: Theme.of(context).primaryColor,size:16.0),
                            Icon(Icons.star,color: Theme.of(context).primaryColor,size:16.0),
                            Icon(Icons.star,color: Theme.of(context).primaryColor,size:16.0),
                            Icon(Icons.star,color: Theme.of(context).primaryColor,size:16.0),
                            Icon(Icons.star,color: Theme.of(context).primaryColor,size:16.0),

                            SizedBox(width: 15.0,),
                            Text(
                              "(" + place.ratings.toString() + "Reviews)",
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    Column(

                      children: <Widget>[
                        Text(
                          place.price.toString(),
                          style:TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.orangeAccent,
                              fontSize: 18.0
                          ),
                        ),
                        Text(
                          "Ticket",
                          style: TextStyle(
                              color: Colors.grey
                          ),
                        ),
                      ],

                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
