import 'package:empw/modules/edit_profile_data.dart';
import 'package:empw/services/user_services.dart';
import 'package:empw/widgets/side_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:provider/provider.dart';

class EditProfileScreen extends StatefulWidget {
  static const routeName = '/edit_profile_screen';

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _salController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();



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
                    } else {
                      Navigator.of(ctx).pop();
                    }
                  },
                )
              ],
            ));
  }

  void _sumbit() async {
    EditProfileData updatedUser = new EditProfileData(
      email: _emailController.text,
      avgSal: _salController.text,
      password: _passwordController.text,
      name: _nameController.text,
    );

    print(updatedUser);
    print("start of sumbit");
    if (!_formKey.currentState.validate()) {
      print("not validated");
      return;
    }
    print(updatedUser);
    Provider.of<UserServices>(context, listen: false)
        .editProfile(updatedUser)
        .then((response) {
      _showDialog(response.message, response.check);
    });
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return Scaffold(
      drawer: SideDrawer(),
      body: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            Container(
              height: mq.height * 0.25,
              child: Stack(children: <Widget>[
                ClipPath(
                    clipper: WaveClipperTwo(flip: true),
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
                  child: Text(
                    "Edit your account",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
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
                      controller: _nameController,
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
                  "Update",
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
          ],
        ),
      ),
    );
  }
}
