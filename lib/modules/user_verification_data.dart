import 'package:flutter/cupertino.dart';

class UserVerificationData {
  String email;
  String password;
  String code;

  UserVerificationData({
    @required this.email,
    @required this.password,
    this.code,
  });

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "password" : password,
      "code": code,
    };
  }
}
