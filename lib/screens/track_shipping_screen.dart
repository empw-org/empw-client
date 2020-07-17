import 'package:empw/widgets/side_drawer.dart';
import 'package:empw/widgets/track_widget.dart';
import 'package:flutter/material.dart';

class TrackShippingScreen extends StatelessWidget {
  static const routeName = "/track_shipping_screen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColorLight,
        title: Text(
          "Shipping Track",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white),
        ),
      ),
      drawer: SideDrawer(),
      body: ListView(
        children: <Widget>[
          TrackWidget(),
        ],
      ),
    );
  }
}
