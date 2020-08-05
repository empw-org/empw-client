import 'package:bezier_chart/bezier_chart.dart';
import 'package:empw/controllers/user_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

Widget sample3(BuildContext context) {
  final fromDate = DateTime(2020, 07, 28);
  final toDate = DateTime.now();

  // final date1 = DateTime.now().subtract(Duration(days: 2));
  // final date2 = DateTime.now().subtract(Duration(days: 3));

  return Center(
    child: Card(
      elevation: 30,
      margin: EdgeInsets.all(0),
      color: Colors.transparent,
      child: Container(
        height: MediaQuery.of(context).size.height / 2.5,
        width: MediaQuery.of(context).size.width,
        child: FutureBuilder(
            future: Provider.of<UserServices>(
              context,
            ).getUserConsumption(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                    child: SpinKitWanderingCubes(
                  color: Colors.white,
                ));
              } else if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.data == null) {
                  print("snapshot.data == null");
                  return Center(
                      child: SpinKitWanderingCubes(
                    color: Colors.white,
                  ));
                } else {
                  List<DataPoint<DateTime>> _items;
                  _items = snapshot.data.data
                      .map<DataPoint<DateTime>>((item) => DataPoint<DateTime>(
                          value: item.consumption, xAxis: item.createdAt))
                      .toList();
                  return BezierChart(
                    fromDate: fromDate,
                    bezierChartScale: BezierChartScale.WEEKLY,
                    toDate: toDate,
                    selectedDate: toDate,
                    series: [
                      BezierLine(
                        label: "Litre",
                        onMissingValue: (dateTime) {
                          if (dateTime.day.isEven) {
                            return 10.0;
                          }
                          return 5.0;
                        },
                        data: _items,
                      ),
                    ],
                    config: BezierChartConfig(
                      verticalIndicatorStrokeWidth: 3.0,
                      verticalIndicatorColor: Colors.black26,
                      showVerticalIndicator: true,
                      verticalIndicatorFixedPosition: false,
                      backgroundColor: Colors.transparent,
                      footerHeight: 50.0,
                    ),
                  );
                }
              }
            }),
      ),
    ),
  );
}
