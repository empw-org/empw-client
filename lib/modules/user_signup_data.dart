import 'package:flutter/cupertino.dart';

class UserSignUpData {
  String name;
  String email;
  String password;
  String phone;
  String ssn;
  String avgSal;

  UserSignUpData({
    @required this.name,
    @required this.email,
    @required this.password,
    @required this.phone,
    @required this.ssn,
    @required this.avgSal,
  });

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "password": password,
      "phone_number": phone,
      "ssn": ssn,
      "salary": avgSal,
    };
  }
}
