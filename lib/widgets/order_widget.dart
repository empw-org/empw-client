import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'dart:math';
import 'package:intl/intl.dart';

class OrderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return Card(
      elevation: 5,
      margin: EdgeInsets.only(top: 15, left: 15, right: 15),
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
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.date_range,
                        color: Colors.black,
                      ),
                      Text(
                        "Arrival date:",
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                      SizedBox(width: 10),
                      Text(
                        DateFormat.yMMMMd().format(DateTime.now()).toString(),
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      )
                    ],
                  ),
                  Divider(),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.place,
                        color: Colors.black,
                      ),
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
              padding: EdgeInsets.all(10),
              height: mq.height * 0.1,
              color: Theme.of(context).primaryColorLight,
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
                        "300 L",
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
                        "\$350",
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
