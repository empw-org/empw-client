import 'package:empw/services/user_services.dart';
import 'package:empw/widgets/side_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = "/profile_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColorLight,
        title: Text(
          "Profile",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white),
        ),
      ),
      drawer: SideDrawer(),
      body: Container(
        child: FutureBuilder(
            future: Provider.of<UserServices>(context, listen: false)
                .getUserProfile(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              print("snaposhot of profile  ${snapshot.data.data}");
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Container(
                    color: Colors.white,
                    child: Center(child: SpinKitFadingCircle(
                      itemBuilder: (BuildContext context, int index) {
                        return DecoratedBox(
                          decoration: BoxDecoration(
                            color: index.isEven ? Colors.red : Colors.green,
                          ),
                        );
                      },
                    )));
              } else if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.data == null) {
                  return Container(
                      color: Colors.white,
                      child: Center(child: SpinKitFadingCircle(
                        itemBuilder: (BuildContext context, int index) {
                          return DecoratedBox(
                            decoration: BoxDecoration(
                              color: index.isEven ? Colors.red : Colors.green,
                            ),
                          );
                        },
                      )));
                } else {
                  return Column(
                    children: <Widget>[Text(snapshot.data.data.name)],
                  );
                }
              }
            }),
      ),
    );
  }
}
