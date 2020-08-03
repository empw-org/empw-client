import 'package:empw/view/screens/edit_profile_screen.dart';
import 'package:empw/controllers/user_services.dart';
import 'package:empw/view/widgets/side_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = "/profile_screen";

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      drawer: SideDrawer(),
      body: Container(
        child: FutureBuilder(
            future: Provider.of<UserServices>(context,)
                .getUserProfile(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Container(
                    color: Theme.of(context).primaryColorLight,
                    child: Center(
                        child: SpinKitWanderingCubes(
                      color: Colors.white,
                    )));
              } else if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.data == null) {
                  return Container(
                      color: Theme.of(context).primaryColorLight,
                      child: Center(
                          child: SpinKitWanderingCubes(
                        color: Colors.white,
                      )));
                } else {
                  return ListView(
                    children: <Widget>[
                      Container(
                        height: mq.height * 0.7,
                        child: Stack(children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(140),
                              bottomRight: Radius.circular(140),
                            ),
                            child: ClipPath(
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
                                  height: mq.height * 0.5,
                                )),
                          ),
                          Card(
                            color: Colors.transparent,
                            elevation: 20,
                            child: Container(
                              height: mq.height * 0.4,
                              width: mq.width,
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColorLight,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(180),
                                  bottomRight: Radius.circular(180),
                                ),
                              ),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      snapshot.data.data.name,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Icon(Icons.email,
                                            color: Colors.white, size: 20),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          snapshot.data.data.email,
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Icon(Icons.phone,
                                            color: Colors.white, size: 20),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          snapshot.data.data.phone,
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ]),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: FlatButton(
                              onPressed: () {
                                Navigator.of(context).pushNamed( EditProfileScreen.routeName);
                              },
                              child: Icon(Icons.settings,
                                  color: Colors.white, size: 30),
                            ),
                          )
                        ]),
                      ),
                    ],
                  );
                }
              }
            }),
      ),
    );
  }
}
