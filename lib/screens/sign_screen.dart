import 'package:empw/modules/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:provider/provider.dart';
import 'login_screen.dart';

class SignScreen extends StatefulWidget {
  static const routeName = '/sign_screen';

  @override
  _SignScreenState createState() => _SignScreenState();
}

class _SignScreenState extends State<SignScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final _passwordController = TextEditingController();
  Map<String, String> _authData = {
    'name': '',
    'phone': '',
    'email': '',
    'snn': '',
    'sal': '',
    'password': '',
  };
  void _sumbit() async{
    if (!_formKey.currentState.validate()) {
      //Invalid
      return;
    }
    _formKey.currentState.save();
    print(_authData);
    await Provider.of<Auth>(context, listen: false).singup(
        _authData['name'],
        _authData['email'],
        _authData['phone'],
        _authData['snn'],
        _authData['sal'],
        _authData['password']);
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return Scaffold(
      body: Form(
        key: _formKey,
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
                  child: Container(
                    width: mq.width * 0.4,
                    height: mq.height * 0.2,
                    child: Image.asset(
                      'assets/images/eye.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20, left: 20),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: "Username",
                        hintText: "Use your real name",
                        prefixIcon: Icon(Icons.perm_identity)),
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Please enter username";
                      }
                    },
                    onSaved: (value) {
                      _authData['name'] = value;
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: "Phone",
                        prefixIcon: Icon(Icons.phone_android)),
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Please enter Phone numebr";
                      }
                    },
                    onSaved: (value) {
                      _authData['phone'] = value;
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: "Email",
                        hintText: "Enter valid Email",
                        prefixIcon: Icon(Icons.alternate_email)),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value.isEmpty || !value.contains('@')) {
                        return "Please enter valid Email";
                      }
                    },
                    onSaved: (value) {
                      _authData['email'] = value;
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: "SSN", prefixIcon: Icon(Icons.credit_card)),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value.isEmpty || value.length != 14) {
                        return "Please enter valid SNN";
                      }
                    },
                    onSaved: (value) {
                      _authData['snn'] = value;
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: "Average Salary",
                        prefixIcon: Icon(Icons.attach_money)),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Please enter your average salary";
                      }
                    },
                    onSaved: (value) {
                      _authData['sal'] = value;
                    },
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
                    keyboardType: TextInputType.text,
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
                    height: 15,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Confirm Password",
                    ),
                    obscureText: true,
                    /*validator: (value) {
                      if (value != _passwordController.text) {
                        return 'Passwords do not match!';
                      }
                    },*/
                  ),
                ],
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
                  "Sign up",
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
