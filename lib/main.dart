import 'package:empw/view/screens/donnation_screen.dart';
import 'package:empw/view/screens/edit_profile_screen.dart';
import 'package:empw/view/screens/make_order_screen.dart';
import 'package:empw/view/screens/orders_history_screen.dart';
import 'package:empw/view/screens/profile_screen.dart';
import 'package:empw/view/screens/login_screen.dart';
import 'package:empw/view/screens/sign_screen.dart';
import 'package:empw/view/screens/start_screen.dart';
import 'package:empw/view/screens/verification_screen.dart';
import 'package:empw/view/screens/track_shipping_screen.dart';
import 'package:empw/controllers/order_service.dart';
import 'package:empw/controllers/user_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:device_preview/device_preview.dart';

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
            create: (ctx) => UserServices(),
          ),
           ChangeNotifierProvider(
            create: (ctx) => OrderServices(),
          ),
          
        ],
        child: Consumer<UserServices>(
          builder: (context, userService, _) => MaterialApp(
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
              VerificationScreen.routeName: (ctx) => VerificationScreen(),
              EditProfileScreen.routeName: (ctx) =>  EditProfileScreen(),
              DonnationScreen.routeName: (ctx) =>   DonnationScreen(),
            },
            home: StartScreen(),
          ),
        ));
  }
}
