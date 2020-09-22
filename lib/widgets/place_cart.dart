import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tourism/providers/Cart.dart';


class PlaceCart extends StatelessWidget {

  final String id;
  final String placeId ;
  final String title;
  final String imagePath;
  final double price;
  final int adults;
  final int children ;
  final DateTime selectedDate ;
  // final double totalPrice ;


  PlaceCart(this.id,this.placeId , this.title, this.imagePath,this.price, this.adults , this.children , this.selectedDate );

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
        Provider.of<Cart>(context , listen: false).removeItem(selectedDate);
      },
      child: Card(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                width: 10.0,
              ),
              Container(
                height: 70.0,
                width: 70.0,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("$imagePath"),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(35.0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black,
                          blurRadius: 5.0,
                          offset: Offset(0.0, 2.0))
                    ]),
              ),
              SizedBox(
                width: 20.0,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Text(
                                "$title",
                                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 5.0),
                              Text(
                                "\u023B $price",
                                style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.orangeAccent,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(width: 50.0),
                          Column(
                            children: <Widget>[
                              Text("Date of visit",
                              style: TextStyle(fontSize: 15.0, color: Colors.green),),
                              SizedBox(height: 5.0),
                              Text(
                                "${selectedDate.toLocal()}".split(' ')[0],
                                style: TextStyle(color: Colors.green, fontSize: 15.0),
                              ),
                            ],
                          ),
                          // SizedBox(width: 10.0),
                          // Column(
                          //   children: <Widget>[
                          //     Text("Total Price",
                          //       style: TextStyle(fontSize: 15.0, color: Colors.green),),
                          //     SizedBox(height: 5.0),
                          //     Text(
                          //       '$totalPrice',
                          //       style: TextStyle(color: Colors.green, fontSize: 15.0),
                          //     ),
                          //   ],
                          // ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 5.0),
                  Container(
                    height: 25.0,
                    width: 150.0,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text("Adults",
                                style: TextStyle(
                                    color: Color(0xFFD3D3D3),
                                    fontWeight: FontWeight.bold)),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              "$adults",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text("Children",
                                style: TextStyle(
                                    color: Color(0xFFD3D3D3),
                                    fontWeight: FontWeight.bold)),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              "$children",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

