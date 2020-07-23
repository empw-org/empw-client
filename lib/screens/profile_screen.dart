import 'package:empw/widgets/side_drawer.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = "/profile_screen";
  final String name;
  final String phone;
  ProfileScreen({@required this.name, @required this.phone});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColorLight,
        title: Text(
          "Profile",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white),
        ),
      ),
      drawer: SideDrawer(),
      body: Column(
        children: <Widget>[
          Text(name),
          Text(phone),
        ],
      ),
    );
  }
}
