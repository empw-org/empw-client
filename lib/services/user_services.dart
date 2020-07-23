import 'package:empw/modules/api_response.dart';
import 'package:empw/modules/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserServices with ChangeNotifier {
  static const _api = 'https://api-empw.herokuapp.com/users';
  static const headers = {
    "Content-Type": "application/json",
  };

  Future<ApiResponse<bool>> singup(User newUser) async {
    final response = await http.post(
      "$_api/signup",
      headers: headers,
      body: json.encode(newUser.toJson()),
    );
    print(response.body);
    if (response.statusCode == 200) {
      //return "You have successfulyy signed up wait for verification code message";
      return ApiResponse<bool>(
          check: true,
          message:
              "You have successfulyy signed up wait for verification code message");
    } else if (response.statusCode == 422) {
      //return "Please ensure that your Email, Phone number and SSN not signed up before";
      return ApiResponse<bool>(
          check: false,
          message:
              "Please ensure that your Email, Phone number and SSN not signed up before");
    }
    return ApiResponse<bool>(check: false, message: "Signed up failed");
  }

  Future<ApiResponse<User>> verifyPhone(String code) async {
    final response = await http.patch(
      "$_api/verify",
      headers: headers,
      body: json.encode({
        "password": "12345678",
        "phone_number": "+201205046671",
        "code": code
      }),
    );
    print(response.body);
    if (response.statusCode == 200) {
      return ApiResponse<User>(
          check: true, message: "Your account successfully verified");
    }
    return ApiResponse<User>(
        check: false, message: "Verification code is not right");
  }

  Future<ApiResponse<User>> login(String email, String password) async {
    final response = await http.post(
      "$_api/login",
      headers: headers,
      body: json.encode({
        "password": password,
        "email": email,
      }),
    );
    print(response.body);
    if (response.statusCode == 200) {
      return ApiResponse<User>(
          check: true, data: User.fromJson(json.decode(response.body)));
    }
    return ApiResponse<User>(
        check: false, data: null, message: "Email or Password not right!");
  }
}
