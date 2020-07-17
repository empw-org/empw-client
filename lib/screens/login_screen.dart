import 'package:empw/widgets/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = "login_screen";
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Container(
            child: Stack(children: <Widget>[
              ClipPath(
                  clipper: WaveClipperTwo(flip : true),
                  child: Container(
                    color: Theme.of(context).primaryColorLight,
                    height: mq.height * 0.35,
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
                    height: mq.height * 0.35,
                  )),
              Positioned(
                top: mq.height * 0.05,
                left: mq.width * 0.03,
               child : Container(
                  width: mq.width * 0.4,
                  height: mq.height * 0.2,
                  child: Image.asset(
                    'assets/images/eye.png',
                    fit: BoxFit.contain,
                  ),
                ),),
               Positioned(
                top: mq.height * 0.1,
                left: mq.width * 0.4,
               child : Text(
                  "Welcome",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontFamily: 'Sacramento',
                    fontWeight: FontWeight.bold,
                  ),
                ), 
               ),
               Positioned(
                top: mq.height * 0.2,
                left: mq.width * 0.4,
               child : Text(
                  "Water is no problem anymore",
                  style: TextStyle(
                    color: Theme.of(context).primaryColorDark,
                    fontSize: 15,
                  ),
                ), 
               ),
            ]), 
          ),
          Expanded(
            child: Container(
              child: LoginForm(),
            ),
          ),
        ],
      ),
    );
  }
}
