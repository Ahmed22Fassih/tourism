import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tourism/pages/cart_screen.dart';
import 'package:tourism/providers/Cart.dart';
import 'package:tourism/providers/place_cart.dart';
import 'package:tourism/providers/places_provider.dart';

class BookNowPage extends StatefulWidget {
  static const routeName = '/Book';

  @override
  _BookNowPageState createState() => _BookNowPageState();
}

class _BookNowPageState extends State<BookNowPage> {


  @override
  Widget build(BuildContext context) {
    final place = ModalRoute.of(context).settings.arguments;
    final loadedPlaceData =
        Provider.of<PlacesProvider>(context, listen: false).findById(place);

    final cart = Provider.of<Cart>(context);
    final numberVisitor = Provider.of<PlaceCart>(context, listen: false);

    // // final totalPlace = ((numberVisitor.price * numberVisitor.numberAdults) + ((numberVisitor.price / 2 ) * numberVisitor.numberChildren ));
    // print(numberVisitor.totalToPlace);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue,
        body: ChangeNotifierProvider(
          create: (context) => PlaceCart(),
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    height: 180.0,
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(
                      loadedPlaceData.imagePath,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 10.0,
                    left: 0.0,
                    child: Container(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context, false);
                        },
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.chevron_left, color: Colors.white),
                            SizedBox(width: 6),
                            Text("Back", style: TextStyle(color: Colors.white)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0.0,
                    bottom: 0.0,
                    child: Container(
                      height: 60.0,
                      width: 150.0,
                      child: Center(
                        child: Text(loadedPlaceData.name,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Adults",
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                    Consumer<PlaceCart>(builder: (context, adult, child) {
                      return Row(
                        children: <Widget>[
                          IconButton(
                              icon: Icon(Icons.add_circle, color: Colors.white),
                              onPressed: () {
                                setState(() {
                                  adult.incrementAdult();
                                });
                              }),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            "${adult.numberAdults}",
                            style:
                                TextStyle(fontSize: 16.0, color: Colors.white),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          IconButton(
                              icon: Icon(Icons.remove_circle,
                                  color: Colors.white),
                              onPressed: () {
                                setState(() {
                                  adult.decreaseAdult();
                                });
                              }),
                        ],
                      );
                    }),
                  ],
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Children",
                        style: TextStyle(fontSize: 20.0, color: Colors.white),
                      ),
                      Consumer<PlaceCart>(builder: (context, child, _) {
                        return Row(
                          children: <Widget>[
                            IconButton(
                                icon:
                                    Icon(Icons.add_circle, color: Colors.white),
                                onPressed: () {
                                  child.incrementChildren();
                                }),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              "${child.numberChildren}",
                              style: TextStyle(
                                  fontSize: 16.0, color: Colors.white),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            IconButton(
                                icon: Icon(
                                  Icons.remove_circle,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  child.decreaseChildren();
                                }),
                          ],
                        );
                      })
                    ],
                  )),
              SizedBox(height: 20.0),
              Container(
                color: Colors.white,
                padding: EdgeInsets.all(30.0),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      FlatButton(
                        onPressed: () => selectDate(context),
                        child: Text(
                          'Check IN',
                          style: TextStyle(fontSize: 20.0, color: Colors.green),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        "${selectedDate.toLocal()}".split(' ')[0],
                        style: TextStyle(color: Colors.green, fontSize: 30.0),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Consumer<PlaceCart>(builder: (context, item, child) {
                return Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            "Total Price",
                            style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                                fontSize: 25.0),
                          ),
                          Text(
                            "120.0",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0),
                          ),
                        ],
                      ),
                      Container(
                        width: 50.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        child: IconButton(
                            icon:
                                Icon(Icons.arrow_forward, color: Colors.white),
                            onPressed: () {
                              Navigator.of(context)
                                  .pushNamed(CartScreen.routeName);
                              setState(() {
                                cart.addItem(
                                  loadedPlaceData.id,
                                  loadedPlaceData.price,
                                  loadedPlaceData.imagePath,
                                  loadedPlaceData.name,
                                  item.adults,
                                  item.children,
                                  selectedDate,
                                  // item.totalPrice,
                                );
                                numberVisitor.clear();
                              });
                            }),
                      ),
                    ],
                  ),
                );
              })
            ],
          ),
        ),
      ),
    );
  }

  DateTime selectedDate = DateTime.now();

  Future<Null> selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }
}
