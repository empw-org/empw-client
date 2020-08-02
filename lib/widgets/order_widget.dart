import 'package:empw/modules/order_summry_data.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class OrderWidget extends StatefulWidget {
  OrderSummeryData orderSummeryData;
  OrderWidget({this.orderSummeryData});

  @override
  _OrderWidgetState createState() => _OrderWidgetState();
}

class _OrderWidgetState extends State<OrderWidget> {
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return Card(
      elevation: 25,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(60), bottomLeft: Radius.circular(60))),
      margin: EdgeInsets.all(15),
      child: Container(
        padding: EdgeInsets.all(20),
        height: mq.height * 0.5,
        child: Column(
          children: <Widget>[
            Text(
              "Order #${Random.secure().nextInt(10000)}",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Theme.of(context).primaryColorLight),
            ),
            Text(
              widget.orderSummeryData.state,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Theme.of(context).primaryColorLight),
            ),
            Divider(),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
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
                        "Ismailia",
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
                        "Cash",
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColorLight,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(60),
                      bottomLeft: Radius.circular(60))),
              padding: EdgeInsets.all(20),
              height: mq.height * 0.1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Amount",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        widget.orderSummeryData.amount,
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Total",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        widget.orderSummeryData.total,
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
