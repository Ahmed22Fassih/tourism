import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tourism/pages/book_now_page.dart';
import 'package:tourism/pages/cart_screen.dart';
import 'package:tourism/pages/home_screen.dart';
import 'package:tourism/pages/place_details_page.dart';
import 'package:tourism/providers/Cart.dart';
import 'package:tourism/providers/bundles_provider.dart';
import 'package:tourism/providers/place_cart.dart';
import 'package:tourism/providers/places_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => PlacesProvider()),
        ChangeNotifierProvider(create: (ctx) => BundlesProvider()),
        ChangeNotifierProvider(create: (ctx) => Cart()),
        ChangeNotifierProvider(create: (ctx) => PlaceCart()),
      ],
      child: MaterialApp(
        title: "tourism",
        theme: ThemeData(primaryColor: Colors.blueAccent),
        home: HomeScreen(),
        routes: {
          PlaceDetailsPage.routeName: (ctx) => PlaceDetailsPage(),
          BookNowPage.routeName: (ctx) => BookNowPage(),
          CartScreen.routeName: (ctx) => CartScreen(),
        },
      ),
    );
  }
}
