import 'package:flutter/cupertino.dart';

class UserProfileData {
  String token;
  String id;
  String name;
  String email;
  String phone;

  UserProfileData({
    @required this.id,
    @required this.name,
    @required this.email,
    @required this.phone,
  });

  factory UserProfileData.fromJson(Map<String, dynamic> returnedUser) {
    return UserProfileData(
      id: returnedUser["_id"],
      name: returnedUser["name"],
      email: returnedUser["email"],
      phone: returnedUser["phone_number"],
    );
  }
}
