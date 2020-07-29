import 'package:empw/screens/profile_screen.dart';
import 'package:empw/services/user_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'login_screen.dart';

class StartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return Container(
      child: FutureBuilder(
          future: Provider.of<UserServices>(context, listen: false).isAuth(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            print("snapshot of start screen : ${snapshot.data}");
            if(snapshot.connectionState == ConnectionState.waiting){
              return Container (
                  color: Colors.white,
                  child: Center(
                    child: SpinKitFadingCircle(
                      itemBuilder: (BuildContext context, int index) {
                        return DecoratedBox(
                          decoration: BoxDecoration(
                            color: index.isEven ? Colors.red : Colors.green,
                          ),
                        );
                      },
                    )));
            }else if(snapshot.connectionState == ConnectionState.done){
            
             if(snapshot.data == true){
               return ProfileScreen();
             }else if(snapshot.data == false){
               return LoginScreen();
             }
            }
            
            
            
          }),
    );
  }
}
