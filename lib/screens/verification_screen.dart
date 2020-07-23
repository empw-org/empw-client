import 'package:empw/services/user_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:provider/provider.dart';

import 'login_screen.dart';

class VerificationScreen extends StatelessWidget {
  static const routeName = "verification_screen";

  @override
  Widget build(BuildContext context) {
    //bool _validator = true;
    final mq = MediaQuery.of(context).size;
    TextEditingController _verificationController = TextEditingController();
    void _showDialog(String message, bool check) {
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                content: Text(
                  message,
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
                      if (check == true) {
                        Navigator.of(ctx)
                            .popAndPushNamed(LoginScreen.routeName);
                      } else {
                        Navigator.of(ctx).pop();
                      }
                    },
                  )
                ],
              ));
    }

    void _sumbit() async {
      // if (_verificationController.text.isEmpty ||
      //     _verificationController.text.length != 6) {
      //   _validator = false;
      // }
      Provider.of<UserServices>(context, listen: false)
          .verifyPhone(_verificationController.text)
          .then((response) {
        print(response.data);
        _showDialog(response.message, response.check);
      });
    }

    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            child: Stack(children: <Widget>[
              ClipPath(
                  clipper: WaveClipperTwo(flip: true),
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
                top: mq.height * 0.15,
                left: mq.width * 0.35,
                child: Text(
                  "Verify Your account",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              "Please enter the 6 digit code sent to your number",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
              border: Border.all(color: Theme.of(context).primaryColorLight),
            ),
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: "Verification code",
                  // errorText:
                  //     _validator ? "" : "Verification code is not right"
                  ),
              keyboardType: TextInputType.number,
              controller: _verificationController,
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 40, left: 40, top: 20, bottom: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Theme.of(context).primaryColorDark,
              gradient: new LinearGradient(colors: [
                Theme.of(context).primaryColorLight,
                Theme.of(context).primaryColor
              ], begin: Alignment.centerLeft, end: Alignment.centerRight),
            ),
            child: FlatButton(
              child: Text(
                "Confirm",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
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