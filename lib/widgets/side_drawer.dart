import 'package:empw/screens/login_screen.dart';
import 'package:empw/screens/make_order_screen.dart';
import 'package:empw/screens/orders_history_screen.dart';
import 'package:empw/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:empw/screens/track_shipping_screen.dart';

class SideDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 15,
            ),
            Row(
              children: <Widget>[
                Container(
                  height: 100,
                  width: 100,
                  child: Image.asset("assets/images/eye.png", fit: BoxFit.contain,)),
                Text("EMPW MENU",
                    style: TextStyle(
                        color: Theme.of(context).primaryColorLight,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Divider(),
            SizedBox(
              height: 10,
            ),
            FlatButton(
              onPressed: () {
                Navigator.pushNamed(context, ProfileScreen.routeName);
              },
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.home,
                    color: Theme.of(context).primaryColorLight,
                    size: 30,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Home",
                      style: TextStyle(
                        fontSize: 18,
                      )),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            FlatButton(
              onPressed: () {
                Navigator.pushNamed(context, MakeOrderScreen.routeName);
              },
              child: Row(
                children: <Widget>[
                  Icon(Icons.add_circle_outline,
                      color: Theme.of(context).primaryColorLight, size: 30),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Make order",
                      style: TextStyle(
                        fontSize: 18,
                      )),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            FlatButton(
              onPressed: () {
                Navigator.pushNamed(context, TrackShippingScreen.routeName);
              },
              child: Row(children: <Widget>[
                Icon(Icons.local_shipping,
                    color: Theme.of(context).primaryColorLight, size: 30),
                SizedBox(
                  width: 10,
                ),
                Text("Track shipping",
                    style: TextStyle(
                      fontSize: 18,
                    )),
              ]),
            ),
            SizedBox(
              height: 15,
            ),
            FlatButton(
              onPressed: () {
                Navigator.pushNamed(context, OrdersHistoryScreen.routeName);
              },
              child: Row(
                children: <Widget>[
                  Icon(Icons.list,
                      color: Theme.of(context).primaryColorLight, size: 30),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Orders history",
                      style: TextStyle(
                        fontSize: 18,
                      )),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Divider(),
            SizedBox(
              height: 15,
            ),
            FlatButton(
              onPressed: () {},
              child: Row(
                children: <Widget>[
                  Icon(Icons.mode_edit,
                      color: Theme.of(context).primaryColorLight, size: 30),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Edit account",
                      style: TextStyle(
                        fontSize: 18,
                      )),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            FlatButton(
              onPressed: () {},
              child: Row(
                children: <Widget>[
                  Icon(Icons.email,
                      color: Theme.of(context).primaryColorLight, size: 30),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Contact us",
                      style: TextStyle(
                        fontSize: 18,
                      )),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Divider(
              thickness: 2,
            ),
            SizedBox(
              height: 15,
            ),
            FlatButton(
              onPressed: () {
                Navigator.pushNamed(context, LoginScreen.routeName);
              },
              child: Row(
                children: <Widget>[
                  Icon(Icons.exit_to_app,
                      color: Theme.of(context).primaryColorLight, size: 30),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Log Out",
                      style: TextStyle(
                        fontSize: 18,
                      )),
                ],
              ),
            ),
             SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
