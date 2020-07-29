import 'package:flutter/cupertino.dart';

class UserLoginData {
  String email;
  String password;

  UserLoginData({
    @required this.email,
    @required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "password": password,
    };
  }
}
