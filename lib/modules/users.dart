import 'package:flutter/material.dart';

class User {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String snn;
  final String avgSal;
  final String password;
  final String imgPass;

  User({
    @required this.id,
    @required this.name,
    @required this.email,
    @required this.phone,
    @required this.snn,
    @required this.avgSal,
    @required this.password,
    @required this.imgPass,
  });
}

class UserProvider with ChangeNotifier{
  List<User> _users = [
    User(
      id: 'u1',
      name: 'Omar Essam',
      password: "1234567",
      email: "omarEssam@gmail.com",
      snn: "123456789123",
      avgSal: "1500",
      imgPass: "assets/images/user.jpg",
      phone: "01119405916",
    ),
  ];

  List<User> get users{
    return[..._users];
  }
}
