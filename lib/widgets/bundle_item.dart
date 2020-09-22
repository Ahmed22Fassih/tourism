import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tourism/providers/bundle.dart';

class BundleItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bundle = Provider.of<Bundle>(context, listen: false);
    return Card(
      elevation: 5.0,
      child: Container(
        height: 200,
        width: 200,
        child: Padding(
          padding: EdgeInsets.only(left: 10.0, top: 10.0, bottom: 10.0),
          child: Row(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    height: 75,
                    width: 100,
                    child: Image.asset(bundle.firstPlaceImagePath,
                        fit: BoxFit.cover),
                  ),
                  SizedBox(height: 5.0),
                  Text("+"),
                  SizedBox(height: 5.0),
                  Container(
                    height: 75,
                    width: 100,
                    child: Image.asset(bundle.secPlaceImagePath,
                        fit: BoxFit.cover),
                  ),
                ],
              ),
              SizedBox(width: 10.0),
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
                              bundle.firstPlaceName,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20.0),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text("+"),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              bundle.secPlaceName,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20.0),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 2.0,
                        ),
                        Text(
                          bundle.description,
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Text(
                                  "Price:",
                                  style: TextStyle(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 5.0,
                                ),
                                Text(
                                  bundle.price.toString(),
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Row(
                              children: <Widget>[
                                Text(
                                  "Points:",
                                  style: TextStyle(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(width: 5.0),
                                Text(
                                  bundle.points.toString(),
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue),
                                )
                              ],
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            showDialog(
                                // context: context,
                                // builder:(ctx)=>
                                );
                          },
                          child: Container(
                            height: 30.0,
                            width: 100.0,
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(20.0)),
                            child: Center(
                              child: Text(
                                "Add",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0),
                              ),
                            ),
                          ),
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
    );
  }
}
