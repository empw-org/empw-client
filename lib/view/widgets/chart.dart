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
                  return Center(
                      child: SpinKitWanderingCubes(
                    color: Colors.white,
                  ));
                } else {
                  if (snapshot.data.check == true &&
                      snapshot.data.data != null) {
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
                  } else if (snapshot.data.check == false &&
                      snapshot.data.message != null) {
                    return Center(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: CircleAvatar(
                            radius: 50,
                            backgroundColor:
                                Theme.of(context).primaryColorLight,
                            child: Image.asset(
                              'assets/images/humidifier.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        
                        Text(
                          "Get your sensor now",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Save water",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "Save money",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w100,
                          ),
                        )
                      ],
                    ));
                  } else if (snapshot.data.data.length == 0) {
                    return Container(child: Text("No records yet"));
                  }
                }
              }
            }),
      ),
    ),
  );
}
