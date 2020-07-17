import 'package:empw/widgets/side_drawer.dart';
import 'package:flutter/material.dart';

class OrdersHistoryScreen extends StatelessWidget {
  static const routeName = "/orders_history_screen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          "Orders history",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white),
        ),
      ),
      drawer: SideDrawer(),
    );
  }
}