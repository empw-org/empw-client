import 'package:empw/modules/orders.dart';
import 'package:empw/modules/auth.dart';
import 'package:empw/screens/make_order_screen.dart';
import 'package:empw/screens/orders_history_screen.dart';
import 'package:empw/screens/profile_screen.dart';
import 'package:empw/screens/login_screen.dart';
import 'package:empw/screens/sign_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:device_preview/device_preview.dart';
import 'package:empw/screens/track_shipping_screen.dart';

void main() => runApp(
  // DevicePreview(
  //   builder: (context) => MyApp(),
  // ),
  MyApp(),
);
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Auth(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => OrderProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,  
        title: 'EMPW',
        theme: ThemeData(
          focusColor: Color(0xff81D4FA),
          primaryColorLight: Color(0xff81D4FA),
          primaryColorDark: Color(0xff003A53),
          accentColor: Color(0xffffffff),
          cardColor: Colors.white,
          dividerColor: Color(0xff81D4FA),
          backgroundColor: Color(0xffEEEEEE),
          fontFamily: 'Lato',
        ),
        routes: {
          ProfileScreen.routeName: (ctx) => ProfileScreen(),
          MakeOrderScreen.routeName: (ctx) => MakeOrderScreen(),
          OrdersHistoryScreen.routeName: (ctx) => OrdersHistoryScreen(),
          LoginScreen.routeName: (ctx) => LoginScreen(),
          SignScreen.routeName: (ctx) => SignScreen(),
          TrackShippingScreen.routeName: (ctx) => TrackShippingScreen(),
        },
        home: LoginScreen(),
      ),
    );
  }
}
