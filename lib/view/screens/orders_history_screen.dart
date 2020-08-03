import 'package:empw/models/order/order_summry_data.dart';
import 'package:empw/controllers/order_service.dart';
import 'package:empw/view/widgets/side_drawer.dart';
import 'package:flutter/material.dart';
import 'package:empw/view/widgets/order_widget.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class OrdersHistoryScreen extends StatelessWidget {
  static const routeName = "/orders_history_screen";
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        drawer: SideDrawer(),
        body: Column(
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
                  top: 60,
                  left: 140,
                  child: Text(
                    "All your orders",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ]),
            ),
            Expanded(
              child: Container(
                color: Colors.transparent,
                child: FutureBuilder(
                  builder: (context, snapshot) {
                    if ((snapshot.connectionState == ConnectionState.none &&
                            snapshot.hasData == null) ||
                        (snapshot.connectionState == ConnectionState.done &&
                            snapshot.data == null)) {
                      return Container(
                          color: Theme.of(context).primaryColorLight,
                          child: Center(
                              child: SpinKitWanderingCubes(
                            color: Colors.white,
                          )));
                    } else if (snapshot.hasData) {
                      return ListView.builder(
                        itemCount: snapshot.data.length != null
                            ? snapshot.data.length
                            : 0,
                        itemBuilder: (context, index) {
                          OrderSummeryData orderSummeryData =
                              new OrderSummeryData(
                            amount: snapshot.data[index]["amount"].toString(),
                            state: snapshot.data[index]["state"],
                            total: Provider.of<OrderServices>(context)
                                .totalMoney(
                                    snapshot.data[index]["amount"].toString()),
                          );
                          return OrderWidget(
                            orderSummeryData: orderSummeryData,
                          );
                        },
                      );
                    }
                    return Container(
                        color: Theme.of(context).primaryColorLight,
                        child: Center(
                            child: SpinKitWanderingCubes(
                          color: Colors.white,
                        )));
                  },
                  future: Provider.of<OrderServices>(
                    context,
                  ).getAllOrders(),
                ),
              ),
            ),
          ],
        ));
  }
}
