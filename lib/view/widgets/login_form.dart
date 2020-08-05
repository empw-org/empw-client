import 'package:empw/models/user/user_login_data.dart';
import 'package:empw/view/screens/profile_screen.dart';
import 'package:empw/view/screens/sign_screen.dart';
import 'package:empw/controllers/user_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  void _showDialog(String message) {
    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
             elevation: 40,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(60), bottomLeft: Radius.circular(60))),
              content: Container(
                height: 120,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Hold On!",
                        style: TextStyle(
                            color: Theme.of(context).primaryColorDark,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                    Text(
                      message,
                      style: TextStyle(
                          color: Theme.of(context).primaryColorLight,
                          fontSize: 18),
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Theme.of(context).primaryColorDark,
                    gradient: new LinearGradient(colors: [
                      Theme.of(context).primaryColorLight,
                      Theme.of(context).primaryColor
                    ], begin: Alignment.centerLeft, end: Alignment.centerRight),
                  ),
                  child: FlatButton(
                    child: Text(
                      "Ok",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            ));
  }

  void _sumbit() {
    UserLoginData userLoginData = new UserLoginData(
        email: _emailController.text, password: _passwordController.text);

    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();

    Provider.of<UserServices>(context, listen: false)
        .login(userLoginData)
        .then((response) {
      if (response.check == true) {
        Navigator.of(context).popAndPushNamed(ProfileScreen.routeName);
      } else {
        _showDialog(response.message);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
      child: Form(
        key: _formKey,
        child: ListView(
                  padding: EdgeInsets.all(0),

          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                labelText: "Email",
              ),
              keyboardType: TextInputType.text,
              validator: (value) {
                if (value.isEmpty) {
                  return "Please enter Email";
                }
              },
              controller: _emailController,
            ),
            SizedBox(
              height: 25,
            ),
            TextFormField(
              decoration: InputDecoration(
                  labelText: "Password",
                  suffixIcon: FlatButton(
                    child: Text(
                      'Forget?',
                      style:
                          TextStyle(color: Theme.of(context).primaryColorLight),
                    ),
                    onPressed: () {},
                  )),
              obscureText: true,
              validator: (value) {
                if (value.isEmpty || value.length < 8) {
                  return "Please enter valid password";
                }
              },
              controller: _passwordController,
            ),
            SizedBox(
              height: 25,
            ),
            Container(
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
                  "Sign in",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                onPressed: () {
                  _sumbit();
                },
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Dont't have an account?",
                  style: TextStyle(color: Colors.grey),
                ),
                FlatButton(
                  child: Text(
                    'Sign up',
                    style:
                        TextStyle(color: Theme.of(context).primaryColorLight),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, SignScreen.routeName);
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
