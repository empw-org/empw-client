import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

import 'login_screen.dart';

class SignScreen extends StatelessWidget {
  static const routeName = '/sign_screen';
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return Scaffold(
      body: Form(
        child: ListView(
          children: <Widget>[
            Container(
              height: mq.height * 0.3,
              child: Stack(children: <Widget>[
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
                    height: mq.height * 0.25,
                  ),
                ),
                Positioned(
                  top: 25,
                  right: 70,
                  child: Card(
                    elevation: 10,
                    color: Colors.transparent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(70)),
                    child: CircleAvatar(
                      radius: 80,
                      backgroundColor: Colors.grey[300],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 70,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.camera_alt, size: 40),
                  ),
                ),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20, left: 20),
              child: Column(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                        labelText: "Username",
                        hintText: "Use your real name",
                        prefixIcon: Icon(Icons.perm_identity)),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: "Phone",
                        prefixIcon: Icon(Icons.phone_android)),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: "Email",
                        hintText: "Enter valid Email",
                        prefixIcon: Icon(Icons.alternate_email)),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                    decoration: InputDecoration(
                        labelText: "SNN", prefixIcon: Icon(Icons.credit_card)),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: "Average Salary",
                        prefixIcon: Icon(Icons.attach_money)),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                 TextFormField(
                    decoration: InputDecoration(
                        labelText: "Password",
                        suffixIcon: Icon(Icons.remove_red_eye),
                        prefixIcon: Icon(Icons.lock_outline)),
                    obscureText: true,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                 TextFormField(
                    decoration: InputDecoration(
                      labelText: "Confirm Password",
                    ),
                    obscureText: true,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 40, left: 40, top: 20, bottom: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                //color: Theme.of(context).primaryColorLight,
                 color: Theme.of(context).primaryColorDark,
                      gradient: new LinearGradient(
                          colors: [
                            Theme.of(context).primaryColorLight,
                            Theme.of(context).primaryColor
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight),
              ),
              child: FlatButton(
                child: Text(
                  "Sign up",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                onPressed: () {},
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Back?",
                  style: TextStyle(color: Colors.grey),
                ),
                FlatButton(
                  child: Text(
                    'Sign in',
                    style:
                        TextStyle(color: Theme.of(context).primaryColorLight),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, LoginScreen.routeName);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
