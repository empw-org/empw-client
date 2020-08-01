import 'package:empw/modules/location_data.dart';
import 'package:empw/modules/make_order_data.dart';
import 'package:empw/services/order_service.dart';
import 'package:empw/widgets/payment.dart';
import 'package:empw/widgets/side_drawer.dart';
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

   void _showDialog() {
    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
              content: Text(
               "hello",
                textAlign: TextAlign.center,
                style: TextStyle(color: Theme.of(context).primaryColorLight),
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text(
                    'Okay',
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
        print("request added wallahy ${response.data}");
                print("request added wallahy ${response.check}");

        _showDialog();
      } else {
        print("fucked up");
      }
    });
  }

  void _location() async {
    Location location = Location();

    await location.getCurrentLocation();
    await print(location.latitude.toString());

  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      drawer: SideDrawer(),
      body: ListView(
        children: <Widget>[
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
                    _location();
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
                "Order",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                ),
              ),
              onPressed: () {
                _sumbit();
              },
            ),
          ),
        ],
      ),
    );
  }
}
