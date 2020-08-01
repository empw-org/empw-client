import 'package:empw/modules/user_signup_data.dart';
import 'package:empw/modules/user_verification_data.dart';
import 'package:empw/screens/verification_screen.dart';
import 'package:empw/services/user_services.dart';
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
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _ssnController = TextEditingController();
  TextEditingController _salController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  void _showDialog(String message, bool check, UserVerificationData userVerificationData) {
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
                    if (check == true) {
                      Navigator.of(ctx)
                          .popAndPushNamed(VerificationScreen.routeName,
                              arguments: VerificationScreen(
                                email: userVerificationData.email,
                                password: userVerificationData.password,
                              ));
                    } else {
                      Navigator.of(ctx).pop();
                    }
                  },
                ))
              ],
            ));
  }

  void _sumbit() async {
    UserSignUpData newUser = new UserSignUpData(
        ssn: _ssnController.text,
        email: _emailController.text,
        avgSal: _salController.text,
        password: _passwordController.text,
        name: _nameController.text,
        phone: _phoneController.text);

    print(newUser);
    print("start of sumbit");
    if (!_formKey.currentState.validate()) {
      print("not validated");
      return;
    }
    print(newUser);
    Provider.of<UserServices>(context, listen: false)
        .singup(newUser)
        .then((response) {
      _showDialog(response.message, response.check, response.data);
    });
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
              height: mq.height * 0.25,
              child: Stack(children: <Widget>[
              ClipPath(
                  clipper: WaveClipperTwo(flip : true),
                  child: Container(
                    color: Theme.of(context).primaryColorLight,
                    height: mq.height * 0.25,
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
                    height: mq.height * 0.25,
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 10,
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
                top: 50,
                left: 140,
               child : Text(
                  "Get your account now",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ), 
               ),])),
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
                      controller: _nameController,
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
                      controller: _phoneController,
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
                      controller: _emailController,
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
                      controller: _ssnController,
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
                      controller: _salController,
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
                      controller: _passwordController,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Confirm Password",
                      ),
                      obscureText: true,
                      validator: (value) {
                        if (value != _passwordController.text) {
                          return 'Passwords do not match!';
                        }
                      },
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
