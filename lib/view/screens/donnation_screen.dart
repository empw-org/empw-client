import 'package:empw/view/widgets/payment.dart';
import 'package:empw/view/widgets/side_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class DonnationScreen extends StatefulWidget {
  static const routeName = "/donnation_screen";

  @override
  _DonnationScreenState createState() => _DonnationScreenState();
}

class _DonnationScreenState extends State<DonnationScreen> {
  int _cnt = 0;

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        drawer: SideDrawer(),
        body: ListView(
          padding: EdgeInsets.all(0),
          children: <Widget>[
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
          Center(child: Text("Money amount", style: TextStyle(fontSize: 20),)),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                  icon: Icon(
                    Icons.arrow_left,
                    size: 50,
                  ),
                  onPressed: () {
                    if (_cnt < 110) {
                      return;
                    } else {
                      setState(() {
                        _cnt -= 10;
                      });
                    }
                  }),
              CircleAvatar(
                radius: 40,
                child: CircleAvatar(
                  backgroundColor: Theme.of(context).primaryColorLight,
                  radius: 35,
                  child: Text(
                    "$_cnt",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              IconButton(
                  icon: Icon(
                    Icons.arrow_right,
                    size: 50,
                  ),
                  onPressed: () {
                    if (_cnt > 490) {
                      return;
                    } else {
                      setState(() {
                        _cnt += 10;
                      });
                    }
                  }),
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
