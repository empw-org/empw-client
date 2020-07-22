import 'package:empw/screens/profile_screen.dart';
import 'package:empw/screens/sign_screen.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  Map<String, String> _authData = {
    'emailPhone': '',
    'password': '',
  };
  final _passwordController = TextEditingController();
  void _sumbit() {
    if (!_formKey.currentState.validate()) {
      //Invalid
      return;
    }
    _formKey.currentState.save();

    ///Login user
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
      child: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                labelText: "Phone / Email",
              ),
              keyboardType: TextInputType.text,
              validator: (value) {
                if (value.isEmpty) {
                  return "Please enter Phone/Email";
                }
              },
              onSaved: (value) {
                _authData['emailPhone'] = value;
              },
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
              controller: _passwordController,
              validator: (value) {
                if (value.isEmpty || value.length < 9) {
                  return "Please enter valid password";
                }
              },
              onSaved: (value) {
                _authData['password'] = value;
              },
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
                  //_sumbit();
                  Navigator.pushNamed(context, ProfileScreen.routeName);
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
