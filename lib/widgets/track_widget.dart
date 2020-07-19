import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter/material.dart';

class TrackWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(50),
        color: Theme.of(context).backgroundColor,
        child: CircularPercentIndicator(
          radius: 300,
          lineWidth: 20.0,
          percent: 0.75,
          header: Text("#Y345695", style: TextStyle(fontSize: 28),),
          center: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.local_shipping, color: Theme.of(context).primaryColorLight, size: 70,),
              Text("Order on Route", style: TextStyle(fontSize: 30, fontFamily: "Sacramento", fontWeight: FontWeight.bold)),
            ],
          ),
          backgroundColor: Colors.grey,
          progressColor: Theme.of(context).primaryColorLight,
          footer: Text("Expected Arrival: 17/7/2020"),
        ));
  }
}
