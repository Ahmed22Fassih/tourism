import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class BundleCart extends StatelessWidget {

  final int id;
  final String placeId ;
  final String firstPlaceName;
  final String firstPlaceImagePath;
  final String secPlaceName;
  final String secPlaceImagePath;
  final String description;
  final int price;
  final int points;
  final int adults ;
  final int children ;

  BundleCart(
      {this.id,
        this.placeId,
        this.firstPlaceName,
        this.firstPlaceImagePath,
        this.secPlaceName,
        this.secPlaceImagePath,
        this.description,
        this.price,
        this.points,
        this.adults,
        this.children,
      });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      background: Container(
        color: Theme.of(context).errorColor,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (direction){
        // Provider.of<Cart>(context , listen: false ).removeItem(placeId);
      },
      child: Card(
        elevation: 5.0,
        child: Container(
          height: 200,
          width: 200,
          child: Padding(
            padding: EdgeInsets.only(left: 10.0 , top: 10.0 , bottom: 10.0),
            child: Row(
              children: <Widget>[
                Container(
                  width: 200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                firstPlaceName,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20.0),
                              ),
                              SizedBox(width: 10.0,),
                              Text("+"),
                              SizedBox(width: 10.0,),
                              Text(
                                secPlaceName,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20.0),
                              ),
                            ],
                          ),
                          SizedBox(height: 2.0,),
                          Text( description
                            , textAlign: TextAlign.justify,),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Text("Price:", style: TextStyle(fontSize: 12.0 , fontWeight: FontWeight.bold),),
                                  SizedBox(width: 5.0,),
                                  Text(price.toString() , style: TextStyle(fontSize: 15.0 , fontWeight: FontWeight.bold , color: Colors.blue),)
                                ],
                              ),
                              SizedBox(height: 5.0,),
                              Row(
                                children: <Widget>[
                                  Text("Points:" , style: TextStyle(fontSize: 12.0 , fontWeight: FontWeight.bold),),
                                  SizedBox(width: 5.0),
                                  Text(points.toString() , style: TextStyle(fontSize: 15.0 , fontWeight: FontWeight.bold , color: Colors.blue),)
                                ],
                              ),
                            ],
                          ),
                          Container(
                            height: 30.0,
                            width: 100.0,
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(20.0)
                            ),
                            child: Center(child: Text("Reserve", style:TextStyle(
                                color: Colors.white ,
                                fontWeight: FontWeight.bold ,
                                fontSize: 15.0 ),),),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

