import 'package:empw/view/widgets/payment.dart';
import 'package:empw/view/widgets/side_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class DonnationScreen extends StatelessWidget {
  static const routeName = "/donnation_screen";

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        drawer: SideDrawer(),
        body: ListView(children: <Widget>[
          Container(
            height: mq.height * 0.3,
            child: Stack(children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(140),
                  bottomRight: Radius.circular(140),
                ),
                child: ClipPath(
                    clipper: WaveClipperTwo(),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColorDark,
                        gradient: new LinearGradient(
                            colors: [
                              Theme.of(context).primaryColorLight,
                              Theme.of(context).primaryColor
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight),
                      ),
                      height: mq.height * 0.3,
                    )),
              ),
              Card(
                  color: Colors.transparent,
                  elevation: 20,
                  child: Container(
                      height: mq.height * 0.2,
                      width: mq.width,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColorLight,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(180),
                          bottomRight: Radius.circular(180),
                        ),
                      ))),
              Positioned(
                child: CircleAvatar(
                  radius: mq.width * 0.16,
                  backgroundColor: Colors.transparent,
                  child: Image.asset(
                    'assets/images/donation.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Positioned(
                top: mq.height * 0.05,
                left: mq.width * 0.35,
                child: Text(
                  "Save lifes",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontFamily: 'Sacramento',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ]),
          ),
          Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColorLight,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20))),
                child: Text(
                  "30\$",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColorLight,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20))),
                child: Text(
                  "60\$",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColorLight,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20))),
                child: Text(
                  "120\$",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
          PaymentContainer(),
          Container(
            margin: EdgeInsets.only(right: 50, left: 50, top: 10, bottom: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Theme.of(context).primaryColorDark,
              gradient: new LinearGradient(colors: [
                Theme.of(context).primaryColorLight,
                Theme.of(context).primaryColor
              ], begin: Alignment.centerLeft, end: Alignment.centerRight),
            ),
            child: FlatButton(
              child: Text(
                "Donate",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              onPressed: () {},
            ),
          ),
        ]));
  }
}
