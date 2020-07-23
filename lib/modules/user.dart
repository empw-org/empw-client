import 'package:flutter/material.dart';

class User {
  String name;
  String email;
  String phone;
  String ssn;
  String avgSal;
  String password;

  User({
    @required this.name,
    @required this.email,
    @required this.phone,
    @required this.ssn,
    @required this.avgSal,
    @required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "phone_number": phone,
      "ssn": ssn,
      "salary": avgSal,
      "password": password,
    };
  }
}
