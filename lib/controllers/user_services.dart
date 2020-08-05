import 'package:empw/models/api_response.dart';
import 'package:empw/models/sensor/consumption.dart';
import 'package:empw/models/user/User_Profile_data.dart';
import 'package:empw/models/user/contact_us_data.dart';
import 'package:empw/models/user/edit_profile_data.dart';
import 'package:empw/models/user/user_login_data.dart';
import 'package:empw/models/user/user_signup_data.dart';
import 'package:empw/models/user/user_verification_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class UserServices with ChangeNotifier {
  static const _api = 'https://api-empw.herokuapp.com/users';
  static const headers = {
    "Content-Type": "application/json",
  };

  Future<bool> isAuth() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey("token")) {
      return false;
    }
    return true;
  }

  Future<ApiResponse<UserVerificationData>> singup(
      UserSignUpData userSignUpData) async {
    final response = await http.post(
      "$_api/signup",
      headers: headers,
      body: json.encode(userSignUpData.toJson()),
    );
    print(response.body);
    if (response.statusCode == 200) {
      return ApiResponse<UserVerificationData>(
          data: UserVerificationData(
              email: userSignUpData.email, password: userSignUpData.password),
          check: true,
          message:
              "You have successfulyy signed up wait for verification code message");
    } else if (response.statusCode == 422) {
      return ApiResponse<UserVerificationData>(
          data: null,
          check: false,
          message:
              "Please ensure that your Email, Phone number and SSN not signed up before");
    }
    return ApiResponse<UserVerificationData>(
        data: null, check: false, message: "Signed up failed");
  }

  Future<ApiResponse<UserProfileData>> verifyPhone(
      UserVerificationData userVerificationData) async {
    final response = await http.patch(
      "$_api/verify",
      headers: headers,
      body: json.encode(userVerificationData.toJson()),
    );
    print(response.body);
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      _saveTokenInSharedPref(jsonData["token"]);
      return ApiResponse<UserProfileData>(
          check: true,
          message: "Your account successfully verified",
          data: UserProfileData.fromJson(jsonData));
    }
    return ApiResponse<UserProfileData>(
        check: false, message: "Verification code is not right");
  }

  Future<ApiResponse<UserProfileData>> getUserProfile() async {
    String token = await _getTokenFromSharedPref();
    await print(token);
    final response = await http.get(
      "https://api-empw.herokuapp.com/user",
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
    );
    print("status : ${response.statusCode}");
    if (response.statusCode == 200) {
      print("here i am");
      final jsonData = json.decode(response.body);

      return ApiResponse<UserProfileData>(
          check: true, data: UserProfileData.fromJson(jsonData));
    }
    return ApiResponse<UserProfileData>(check: false, data: null);
  }

  Future<ApiResponse<UserProfileData>> login(
      UserLoginData userLoginData) async {
    final response = await http.post(
      "$_api/login",
      headers: headers,
      body: json.encode(userLoginData.toJson()),
    );
    print(response.body);
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      _saveTokenInSharedPref(jsonData["token"]);
      return ApiResponse<UserProfileData>(
          check: true, data: UserProfileData.fromJson(jsonData));
    }
    return ApiResponse<UserProfileData>(
        check: false, data: null, message: "Email or Password not right!");
  }

  Future<ApiResponse<bool>> contactus(ContactUSData contactUSData) async {
    final response = await http.post(
      'https://api-empw.herokuapp.com/contact_us',
      headers: headers,
      body: json.encode(contactUSData.toJson()),
    );
    print(response.body);
    if (response.statusCode == 201) {
      return ApiResponse<bool>(
          check: true, message: "Thanks, we'll reply as soon as possible.");
    }
    return ApiResponse<bool>(check: false, message: "Something is wrong!");
  }

  Future<ApiResponse<bool>> editProfile(EditProfileData editProfileData) async {
    final response = await http.patch(
      "$_api/verify",
      headers: headers,
      body: json.encode(editProfileData.toJson()),
    );
    print(response.body);
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      _saveTokenInSharedPref(jsonData["token"]);
      return ApiResponse<bool>(
          check: true,
          message: "Your account successfully updated",
          data: true);
    }
    return ApiResponse<bool>(
        check: false, message: "Something went wrong, try again!");
  }

  Future<ApiResponse<List<ConsumptionPoint>>> getUserConsumption() async {
    String token = await _getTokenFromSharedPref();
    await print(token);
    final response = await http.get(
      "https://api-empw.herokuapp.com/consumption_reports",
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
    );
    print("status : ${response.statusCode}");
    if (response.statusCode == 200) {
      final consumptionPoints = welcomeFromJson(response.body);
      print(consumptionPoints[1].consumption);
      return ApiResponse<List<ConsumptionPoint>>(
          check: true, data: consumptionPoints);
    }
    return ApiResponse<List<ConsumptionPoint>>(check: false, data: null);
  }

  Future<void> removeTokenInSharedPref() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
    notifyListeners();
  }

  Future<void> _saveTokenInSharedPref(String returnedToken) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('token', returnedToken);
    notifyListeners();
  }

  Future<String> _getTokenFromSharedPref() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    return token;
  }
}
