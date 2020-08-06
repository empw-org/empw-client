import 'package:empw/models/order/make_order_data.dart';
import 'package:empw/view/screens/orders_history_screen.dart';
import 'package:empw/view/screens/track_shipping_screen.dart';
import 'package:empw/controllers/location_services.dart';
import 'package:empw/controllers/order_service.dart';
import 'package:empw/view/widgets/payment.dart';
import 'package:empw/view/widgets/side_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:provider/provider.dart';

class MakeOrderScreen extends StatefulWidget {
  static const routeName = "/make_order_screen";

  @override
  _MakeOrderScreenState createState() => _MakeOrderScreenState();
}

class _MakeOrderScreenState extends State<MakeOrderScreen> {
  int _cnt = 100;
  String _address = "Location";
  double _containerPercent() {
    if (_cnt >= 410) {
      return 410 / 500;
    }
    return (_cnt / 500);
  }

  bool _isSwitched = false;

  void _showDialog(String message) {
    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
              elevation: 40,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(60), bottomLeft: Radius.circular(60))),
              content: Container(
                height: 120,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Hold On!",
                        style: TextStyle(
                            color: Theme.of(context).primaryColorDark,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                    Text(
                      message,
                      style: TextStyle(
                          color: Theme.of(context).primaryColorLight,
                          fontSize: 18),
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Theme.of(context).primaryColorDark,
                    gradient: new LinearGradient(colors: [
                      Theme.of(context).primaryColorLight,
                      Theme.of(context).primaryColor
                    ], begin: Alignment.centerLeft, end: Alignment.centerRight),
                  ),
                  child: FlatButton(
                    child: Text(
                      "Ok",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            ));
  }

  void _showSummeryDialog() {
    final mq = MediaQuery.of(context).size;

    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
              elevation: 40,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              content: Container(
                height: mq.height * 0.45,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    CircleAvatar(
                      radius: mq.width * 0.15,
                      backgroundColor: Theme.of(context).primaryColorLight,
                      child: Image.asset(
                        'assets/images/eye.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.place,
                          color: Colors.black,
                        ),
                        SizedBox(width: 5),
                        Text(
                          "Location:",
                          style: TextStyle(fontSize: 15, color: Colors.black),
                        ),
                        SizedBox(width: 10),
                        Text(
                          _address,
                          style: TextStyle(fontSize: 15, color: Colors.black),
                        )
                      ],
                    ),
                    Divider(),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.local_drink,
                          color: Colors.black,
                        ),
                        SizedBox(width: 5),
                        Text(
                          "Amount:",
                          style: TextStyle(fontSize: 15, color: Colors.black),
                        ),
                        SizedBox(width: 10),
                        Text(
                          _cnt.toString(),
                          style: TextStyle(fontSize: 15, color: Colors.black),
                        )
                      ],
                    ),
                    Divider(),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.attach_money,
                          color: Colors.black,
                        ),
                        SizedBox(width: 5),
                        Text(
                          "Total money",
                          style: TextStyle(fontSize: 15, color: Colors.black),
                        ),
                        SizedBox(width: 10),
                        Text(
                          Provider.of<OrderServices>(context, listen: false)
                              .totalMoney(_cnt.toString()),
                          style: TextStyle(fontSize: 15, color: Colors.black),
                        )
                      ],
                    ),
                    Divider(),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.payment,
                          color: Colors.black,
                        ),
                        SizedBox(width: 5),
                        Text(
                          "Payment method:",
                          style: TextStyle(fontSize: 15, color: Colors.black),
                        ),
                        SizedBox(width: 10),
                        Text(
                          _isSwitched ? "Online" : "Cash",
                          style: TextStyle(fontSize: 15, color: Colors.black),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 70, right: 70, bottom: 10),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Theme.of(context).primaryColorDark,
                    gradient: new LinearGradient(colors: [
                      Theme.of(context).primaryColorLight,
                      Theme.of(context).primaryColor
                    ], begin: Alignment.centerLeft, end: Alignment.centerRight),
                  ),
                  child: FlatButton(
                    child: Text(
                      "Order now!",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    onPressed: () {
                      _sumbit();
                    },
                  ),
                ),
                FlatButton(
                  child: Text(
                    'Dismiss',
                    style:
                        TextStyle(color: Theme.of(context).primaryColorLight),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            ));
  }

  void _sumbit() async {
    Location location = Location();

    await location.getCurrentLocation();
    await print(location.latitude.toString());
    MakeOrderData makeOrderData =
        new MakeOrderData(amount: _cnt.toString(), location: location);

    await Provider.of<OrderServices>(context, listen: false)
        .makeOrder(makeOrderData)
        .then((response) {
      if (response.check == true) {
        Navigator.of(context).pushNamed(OrdersHistoryScreen.routeName);
      } else {
        _showDialog(response.message);
      }
    });
  }

  void _getAddress() async {
    Location location = Location();
    await location.getCurrentLocation();
    await location.getCurrentAdress();
    await print(location.address);
    await setState(() {
      _address = location.address == null ? "No readable adress, Long = ${location.longitude}, Lati = ${location.latitude}" : location.address;
    });
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      drawer: SideDrawer(),
      body: ListView(
        padding: EdgeInsets.all(0),
        children: <Widget>[
          Container(
              height: mq.height * 0.25,
              child: Stack(children: <Widget>[
                ClipPath(
                    clipper: WaveClipperTwo(flip: true),
                    child: Container(
                      color: Theme.of(context).primaryColorLight,
                      height: mq.height * 0.25,
                    )),
                ClipPath(
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
                    height: mq.height * 0.25,
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  child: Container(
                    width: mq.width * 0.4,
                    height: mq.height * 0.2,
                    child: Image.asset(
                      'assets/images/eye.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Positioned(
                  top: 50,
                  left: 140,
                  child: Text(
                    "Order your water now!",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ])),
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.only(left: 30, right: 30, top: 30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: Theme.of(context).primaryColorLight,
                width: 2,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  _address,
                  style: TextStyle(fontSize: 20, color: Colors.grey),
                ),
                IconButton(
                  onPressed: () {
                    _getAddress();
                  },
                  icon: Icon(
                    Icons.location_on,
                    color: Colors.grey,
                    size: 30,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            height: mq.height * 0.4,
            width: mq.width * 0.6,
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    child: Image.asset(
                      "assets/images/water-tank.png",
                      scale: 0.08,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: FractionallySizedBox(
                    heightFactor: _containerPercent(),
                    child: ClipPath(
                      clipper: WaveClipperTwo(
                        reverse: true,
                      ),
                      child: Container(
                        width: mq.width * 0.5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(25),
                              bottomRight: Radius.circular(25)),
                          color: Theme.of(context)
                              .primaryColorDark
                              .withOpacity(0.5),
                          gradient: new LinearGradient(
                              colors: [
                                Theme.of(context).primaryColorLight,
                                Theme.of(context).primaryColor
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight),
                        ),
                        height: mq.height * 0.25,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
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
          Container(
            padding: EdgeInsets.all(20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Pay Online",
                  style: TextStyle(fontSize: 30),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  width: 70,
                  child: Switch(
                    value: _isSwitched,
                    onChanged: (value) {
                      setState(() {
                        _isSwitched = value;
                        print(_isSwitched);
                      });
                    },
                    activeTrackColor: Theme.of(context).primaryColorLight,
                    activeColor: Theme.of(context).primaryColorDark,
                  ),
                ),
              ],
            ),
          ),
          _isSwitched ? PaymentContainer() : Container(),
          Container(
            margin: EdgeInsets.only(left: 70, right: 70, bottom: 20),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Theme.of(context).primaryColorDark,
              gradient: new LinearGradient(colors: [
                Theme.of(context).primaryColorLight,
                Theme.of(context).primaryColor
              ], begin: Alignment.centerLeft, end: Alignment.centerRight),
            ),
            child: FlatButton(
              child: Text(
                "Check out",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                ),
              ),
              onPressed: () {
                _showSummeryDialog();
              },
            ),
          ),
        ],
      ),
    );
  }
}
