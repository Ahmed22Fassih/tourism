import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tourism/pages/cart_screen.dart';
import 'package:tourism/pages/favorite_page.dart';
import 'package:tourism/providers/bundles_provider.dart';
import 'package:tourism/widgets/app_drawer.dart';
import 'package:tourism/widgets/bundle_item.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final bundleData = Provider.of<BundlesProvider>(context);
    final bundles = bundleData.itemsBundle;

    return Scaffold(
        drawer: AppDrawer(),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.blue),
          title: Text("Trips" , style: TextStyle(fontSize: 20.0 , color: Colors.blue),),
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.search,
                  color: Theme.of(context).primaryColor,
                ),
                onPressed: () {
                  // Navigator.of(context).push(MaterialPageRoute(
                  //   // builder: (BuildContext context) => SearchPage(),
                  // ));
                }),

            IconButton(
                icon: Icon(
                  Icons.favorite,
                  color: Colors.red,
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => FavoritePage(
                    ),
                  ));
                }),

            IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => CartScreen(
                    ),
                  ));
                }),

          ],
        ),
        body:  ListView.builder(
          itemCount: bundles.length,
          itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
            value: bundles[i],
            child: BundleItem(),
          ),
        ),
    );
  }
}
