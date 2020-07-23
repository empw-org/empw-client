import 'package:flutter/material.dart';

class User {
  String token;
  String id;
  String name;
  String email;
  String phone;
  String ssn;
  String avgSal;
  String password;
  bool isVerified;

  User({
    @required this.name,
    @required this.email,
    @required this.phone,
    @required this.ssn,
    @required this.avgSal,
    this.password,
    this.id,
    this.token,
    this.isVerified,
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

  factory User.fromJson(Map<String, dynamic> returnedUser) {
    return User(
      id:returnedUser["user"]["_id"],
      name: returnedUser["user"]["name"],
      email: returnedUser["user"]["email"],
      phone: returnedUser["user"]["phone_number"],
      avgSal: returnedUser["user"]["salary"].toString(),
      ssn: returnedUser["user"]["ssn"].toString(),
      isVerified: returnedUser["user"]["is_verified"],
      token: returnedUser["token"],
    );
  }
}
