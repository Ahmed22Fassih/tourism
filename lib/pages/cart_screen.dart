import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tourism/providers/Cart.dart';
import '../widgets/place_cart.dart' as crt  ;

class CartScreen extends StatelessWidget {
  static const routeName = 'Cart';
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Cart"),
      ),
      body: Column(
        children: <Widget>[
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Total", style: TextStyle(fontSize: 20)),
                  SizedBox(width: 10),
                  Chip(
                    label: Text(
                      "\$${cart.totalAmount.toStringAsFixed(2)}",
                      style: TextStyle(
                          color:
                              Theme.of(context).primaryTextTheme.title.color),
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  FlatButton(
                    child: Text('ORDER NOW'),
                    onPressed: () {},
                    textColor: Theme.of(context).primaryColor,
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
                itemCount: cart.items.length,
                itemBuilder: (ctx, i) => crt.PlaceCart(
                  cart.items.values.toList()[i].id,
                  cart.items.keys.toList()[i].toIso8601String(),
                  cart.items.values.toList()[i].title,
                  cart.items.values.toList()[i].imagePath,
                  cart.items.values.toList()[i].price,
                  cart.items.values.toList()[i].adults,
                  cart.items.values.toList()[i].children,
                  cart.items.values.toList()[i].selectTime,
                  // cart.items.values.toList()[i].totalPrice,
                )),
          )
        ],
      ),
    );
  }
}
