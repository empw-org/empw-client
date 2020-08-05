import 'package:empw/controllers/user_services.dart';
import 'package:empw/models/user/contact_us_data.dart';
import 'package:empw/view/widgets/side_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContactUS extends StatefulWidget {
  static const routeName = "/contact_us_screen";

  @override
  _ContactUSState createState() => _ContactUSState();
}

class _ContactUSState extends State<ContactUS> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  TextEditingController _nameController = TextEditingController();

  TextEditingController _messageController = TextEditingController();

  TextEditingController _emailController = TextEditingController();

  void _showDialog(bool check, String message) {
    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
              elevation: 40,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(60),
                      bottomLeft: Radius.circular(60))),
              content: check
                  ? Container(
                      height: 120,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Thanks,",
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
                    )
                  : Container(
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
    ContactUSData contactUSData = new ContactUSData(
        email: _emailController.text,
        name: _nameController.text,
        message: _messageController.text);

    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();

    Provider.of<UserServices>(context, listen: false)
        .contactus(contactUSData)
        .then((response) {
      if (response.check == true) {
        _showDialog(true, response.message);
      } else {
        _showDialog(false, response.message);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return Scaffold(
        drawer: SideDrawer(),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Container(
              color: Colors.white,
              height: mq.height,
              child: Stack(children: <Widget>[
                Container(
                  height: mq.height * 0.55,
                  color: Theme.of(context).primaryColorLight,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircleAvatar(
                          radius: mq.width * 0.25,
                          backgroundColor: Colors.transparent,
                          child: Image.asset(
                            'assets/images/mail.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "CONTACT US",
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Row(children: <Widget>[
                                      Icon(
                                        Icons.mail_outline,
                                        color: Colors.white,
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        "Email",
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.white),
                                      ),
                                    ]),
                                    Text(
                                      "empw.org@gmail.com",
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.white),
                                    ),
                                  ],
                                ),
                                SizedBox(width: 10),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Row(children: <Widget>[
                                      Icon(
                                        Icons.phone_android,
                                        color: Colors.white,
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        "Phone",
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.white),
                                      ),
                                    ]),
                                    Text(
                                      "+20 11549872",
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.white),
                                    ),
                                  ],
                                ),
                              ]),
                        ),
                        SizedBox(
                          height: 30,
                        )
                      ]),
                ),
                Positioned(
                  top: mq.height * 0.5,
                  left: 25,
                  right: 25,
                  child: Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(60),
                              bottomLeft: Radius.circular(60))),
                      child: Container(
                          height: mq.height * 0.45,
                          width: mq.width,
                          padding: EdgeInsets.all(10),
                          child: Column(children: <Widget>[
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: "Name",
                              ),
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "Please enter valid name";
                                }
                              },
                              controller: _nameController,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: "Email",
                                hintText: "Enter valid Email",
                              ),
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value.isEmpty || !value.contains('@')) {
                                  return "Please enter valid Email";
                                }
                              },
                              controller: _emailController,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            TextFormField(
                              maxLines: 3,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                labelText: "Message",
                              ),
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "Please Leave your message";
                                }
                              },
                              controller: _messageController,
                            ),
                          ]))),
                ),
                Positioned(
                  bottom: mq.height * 0.005,
                  left: mq.width * 0.35,
                  child: CircleAvatar(
                    radius: 55,
                    backgroundColor: Colors.white,
                  ),
                ),
                Positioned(
                  bottom: mq.height * 0.01,
                  left: mq.width * 0.38,
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor: Theme.of(context).primaryColorLight,
                    child: FlatButton(
                      child: Icon(
                        Icons.send,
                        color: Colors.white,
                        size: 50,
                      ),
                      onPressed: () {
                        _sumbit();
                      },
                    ),
                  ),
                ),
              ]),
            ),
          ),
        ));
  }
}
