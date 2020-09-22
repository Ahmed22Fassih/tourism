import 'package:flutter/material.dart';
import 'package:tourism/pages/places_page.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      child: Drawer(
        child: Column(
          children: <Widget>[
            SizedBox(height: 20.0),
            IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context, false)),
            ListTile(
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => PlacesPage()
                )
                );
              },
              title: Text(
                "Places",
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            ListTile(
              onTap: () {
                // Navigator.of(context).pop();
                // Navigator.of(context).push(MaterialPageRoute(
                //     // builder: (BuildContext context) => BundlePage()
                // ));
              },
              title: Text(
                "Bundles",
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            ListTile(
              onTap: () {
                // Navigator.of(context).pop();
                // Navigator.of(context).push(MaterialPageRoute(
                //     // builder: (BuildContext context) => SignUpPage()
                // ));
              },
              title: Text(
                "Sign Up",
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            ListTile(
              onTap: () {
                // Navigator.of(context).pop();
                // Navigator.of(context).push(MaterialPageRoute(
                //     // builder: (BuildContext context) => LoginPage()
                // ));
              },
              title: Text(
                "Login",
                style: TextStyle(fontSize: 16.0),
              ),
            )
          ],
        ),
      ),
    );
  }
}
