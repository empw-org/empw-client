import 'package:empw/view/screens/profile_screen.dart';
import 'package:empw/controllers/user_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'login_screen.dart';

class StartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
          future: Provider.of<UserServices>(context).isAuth(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Container(
                  color: Theme.of(context).primaryColorLight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Center(
                        child: CircleAvatar(
                          radius: MediaQuery.of(context).size.width / 4,
                          backgroundColor: Theme.of(context).primaryColorLight,
                          child: Image.asset(
                            'assets/images/eye.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Center(
                          child: SpinKitWanderingCubes(
                        size: 30,
                        color: Colors.white,
                      )),
                      Column(
                        children: <Widget>[
                          Text(
                            "from",
                            style: TextStyle(color: Colors.white),
                          ),
                          Text("E M P W",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold)),
                        ],
                      )
                    ],
                  ));
            } else {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Container(
                  color: Theme.of(context).primaryColorLight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Center(
                        child: CircleAvatar(
                          radius: MediaQuery.of(context).size.width / 4,
                          backgroundColor: Theme.of(context).primaryColorLight,
                          child: Image.asset(
                            'assets/images/eye.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Center(
                          child: SpinKitWanderingCubes(
                        size: 30,
                        color: Colors.white,
                      )),
                      Column(
                        children: <Widget>[
                          Text(
                            "from",
                            style: TextStyle(color: Colors.white),
                          ),
                          Text("E M P W",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold)),
                        ],
                      )
                    ],
                  ));
              } else if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.data == true) {
                  return ProfileScreen();
                } else if (snapshot.data == false) {
                  return LoginScreen();
                }
              }
            }
          }),
    );
  }
}
