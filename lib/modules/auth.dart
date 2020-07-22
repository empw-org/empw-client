import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Auth with ChangeNotifier {
  String token;
  DateTime expireDate;
  String id;
  String name;
  String email;
  String phone;
  String snn;
  String avgSal;
  String password;

  Future<void> singup(String name, String email, String phone, String snn,
      String avgSal, String password) async {
    const String singupUrl = "https://api-empw.herokuapp.com/users/signup";

    final response = await http.post(singupUrl,
    headers: {"Content-Type" : "application/json"},
        body: json.encode({
          "name": name,
          "email": email,
          "password": password,
          "phone_number": phone,
          "ssn": snn,
          "salary": avgSal,
        }
        ));
    if (response.body.isNotEmpty) {
      print(json.decode(response.body));
    }else{
      print("empty");
    }
  }
}
